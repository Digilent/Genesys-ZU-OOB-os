HOMEPAGE = "https://github.com/linux4wilc/firmware"

LICENSE = "WILC-Firmware"
NO_GENERIC_LICENSE[WILC-Firmware] = "LICENCE.wilc_fw"

LIC_FILES_CHKSUM = "file://LICENCE.wilc_fw;md5=89ed0ff0e98ce1c58747e9a39183cc9f"
SRC_URI = "git://github.com/linux4wilc/firmware.git;branch=dev"
SRCREV = "571a3bea4c54580a63ebed81f7ebc24f97b7a9f4"
PE = "1"
PV = "0.0+git${SRCPV}"

S = "${WORKDIR}/git"

inherit allarch

CLEANBROKEN = "1"

do_compile() {
    :
}

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/mchp
    cp wilc*.bin ${D}${nonarch_base_libdir}/firmware/mchp

    # For license package:
    install -m 0644 LICENCE.wilc_fw ${D}${nonarch_base_libdir}/firmware/mchp/
}

PACKAGES =+ " \
    ${PN}-1000-wifi \
    ${PN}-3000-wifi \
    ${PN}-3000-ble \
    ${PN}-license \
"

RDEPENDS_${PN}-1000-wifi = "${PN}-license"
RDEPENDS_${PN}-3000-wifi = "${PN}-license"
RDEPENDS_${PN}-3000-ble = "${PN}-license"

FILES_${PN}-1000-wifi = "${nonarch_base_libdir}/firmware/mchp/wilc1000_wifi_firmware.bin"
FILES_${PN}-3000-wifi = "${nonarch_base_libdir}/firmware/mchp/wilc3000_wifi_firmware.bin"
FILES_${PN}-3000-ble = "${nonarch_base_libdir}/firmware/mchp/wilc3000_ble*.bin"
FILES_${PN}-license += "${nonarch_base_libdir}/firmware/mchp/LICENCE.wilc_fw"

FILES_${PN} += "${nonarch_base_libdir}/firmware/mchp/*"
RDEPENDS_${PN} += "${PN}-license"

# Make wilc-firmware depend on all of the split-out packages.
python populate_packages_prepend () {
    firmware_pkgs = oe.utils.packages_filter_out_system(d)
    d.appendVar('RDEPENDS_wilc-firmware', ' ' + ' '.join(firmware_pkgs))
}
