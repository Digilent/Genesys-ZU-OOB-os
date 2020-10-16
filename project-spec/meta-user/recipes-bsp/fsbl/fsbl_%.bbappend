FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "\
	file://0001-Commented-I2C-mux-code-for-Digilent-Genesys-ZU.patch \
	file://0002-Exclude-fsbl-code-to-make-it-fit.patch \
	file://0003-fsbl-Reset-usb-phys-and-hub-upon-board-init.patch \
	file://0004-zynqmp_fsbl-Authentication-restored-for-booting-BOOT.patch \
	file://0005-zynqmp_fsbl-Fixed-Genesys-ZU-board-defines-to-match-.patch \
	file://0006-zynqmp_fsbl-Missing-includes-and-guards-for-board-de.patch \
	"

YAML_COMPILER_FLAGS_append = " -DUHS_MODE_ENABLE"
YAML_COMPILER_FLAGS_append = " -DFSBL_DEBUG_INFO"
YAML_COMPILER_FLAGS_append = " -DXFSBL_PERF"
YAML_COMPILER_FLAGS_append = " -DXPS_BOARD_GZU_3EG"
