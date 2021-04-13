# build root filesystem for various boards

#DEFAULT BUILD SETTINGS

OS=$(shell head -n 1 /etc/os-release)
#Required only on arch linux since is not using /sbin and /bin PATH
ifeq ($(OS), NAME="Arch Linux")
	export PATH := $(PATH):/usr/sbin:/sbin:/bin
endif

BOARD ?= genesys-zu
BOARD_TYPE ?= 5ev

output_dir = images/linux
input_dir = images/linux
emmc_img_path = ${output_dir}/${BOARD}-${BOARD_TYPE}.img
emmc_img_boot_path = ${output_dir}/boot

#TARGETS
.PHONY: all
all: image

.PHONY: prepare_package
prepare_package:
	@[ -d "${input_dir}" ] || { echo "PLEASE BUILD FIRST"; exit 1; }
	@mkdir -pv ${output_dir}

.PHONY: prepare_image
prepare_image: prepare_package
	@[ ! -f ${emmc_img_path} ] || rm ${emmc_img_path};
	@dd if=/dev/zero of=${emmc_img_path} bs=1M count=300 status=progress;
	@sync;
	@sfdisk ${emmc_img_path} < ${BOARD}.img.sfdisk;
	@sync;

.PHONY: build_image
build_image: prepare_image
	@export disk_file=$$(sudo losetup --show -f -P ${emmc_img_path}); \
	echo new loop device on: $${disk_file}; \
	sudo mkfs.msdos -F 32 -n boot $${disk_file}p1; \
	sync; \
	mkdir -p ${emmc_img_boot_path}; \
	if mountpoint -q -- "${emmc_img_boot_path}"; then \
		sudo umount -v $${emmc_img_boot_path}; \
	fi; \
	sudo mount -v -o uid=$$(id -u),gid=$$(id -g) $${disk_file}p1 ${emmc_img_boot_path}; \
	if mountpoint -q -- "${emmc_img_boot_path}"; then \
		cp -v ${input_dir}/BOOT.BIN ${emmc_img_boot_path}; \
		cp -v ${input_dir}/image.ub ${emmc_img_boot_path}; \
		cp -v ${input_dir}/boot.scr ${emmc_img_boot_path}; \
		sync; \
		sudo umount -v $${disk_file}p1 && \
		rm -rv ${emmc_img_boot_path}; \
	fi; \
	sudo losetup -d $${disk_file}; \
	echo loop device off; \

.PHONY: compress_image
compress_image:
	@dd if=${emmc_img_path} | gzip > ${emmc_img_path}.gz
	@zip ${emmc_img_path}.zip ${emmc_img_path}
	@echo output image file: ${emmc_img_path}.gz
	@echo output image file: ${emmc_img_path}.zip

.PHONY: image
image: build_image compress_image
