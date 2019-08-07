FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Rmeove-i2c-mux-code.patch \
			file://0002-Exclude-fsbl-code-to-make-it-fit.patch \
			"
YAML_COMPILER_FLAGS_append = " -DUHS_MODE_ENABLE"
