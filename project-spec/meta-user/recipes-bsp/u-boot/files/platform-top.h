#include <configs/platform-auto.h>
#define CONFIG_SYS_BOOTM_LEN 0xF000000

#define DFU_ALT_INFO_RAM \
                "dfu_ram_info=" \
        "setenv dfu_alt_info " \
        "image.ub ram $netstart 0x1e00000\0" \
        "dfu_ram=run dfu_ram_info && dfu 0 ram 0\0" \
        "thor_ram=run dfu_ram_info && thordown 0 ram 0\0"

#define DFU_ALT_INFO_MMC \
        "dfu_mmc_info=" \
        "set dfu_alt_info " \
        "${kernel_image} fat 0 1\\\\;" \
        "dfu_mmc=run dfu_mmc_info && dfu 0 mmc 0\0" \
        "thor_mmc=run dfu_mmc_info && thordown 0 mmc 0\0"

#define CONFIG_PREBOOT "echo U-BOOT for Zuca TEST; "\
	"setenv img_addr 0x10000000; "\
	"setenv img_name image.ub; "\
	"setenv mac_addr 0x13ffff0; "\
	"setenv mac_qspi_addr 0x1FFF000; "\
	"setenv mac_length 0x6; "\
	"setenv mac_dtb_path /amba/ethernet@ff0b0000; "\
	"setenv mac_dtb_prop local-mac-address; "\
	"setenv mac_read_qspi_data \"sf read '${mac_addr}' '${mac_qspi_addr}' '${mac_length}';\"; "\
	"setenv mac_read_dtb_addr \"fdt get addr mac_dtb_addr '${mac_dtb_path}' '${mac_dtb_prop}';\"; "\
	"setenv mac_write_dtb \"cp.b '${mac_addr}' '${mac_dtb_addr}' '${mac_length}';\"; "\
	"setenv mac_load \"run mac_read_qspi_data && run mac_read_dtb_addr && run mac_write_dtb;\"; "\
	"setenv mac_ch_boot \""\
		"load mmc 0:1 '${img_addr}' '${img_name}' && "\
		"sf probe && "\
		"bootm start '$img_addr' && "\
		"bootm loados && "\
		"bootm ramdisk && "\
		"bootm fdt && "\
		"bootm prep && "\
		"run mac_load && "\
		"bootm go; "\
	"\"; "\
	"setenv default_bootcmd run mac_ch_boot"

/*Required for uartless designs */
#ifndef CONFIG_BAUDRATE
#define CONFIG_BAUDRATE 115200
#ifdef CONFIG_DEBUG_UART
#undef CONFIG_DEBUG_UART
#endif
#endif
