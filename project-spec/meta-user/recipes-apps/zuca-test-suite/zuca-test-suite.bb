#
# This file is the zuca-test-suite recipe.
#

SUMMARY = "Simple zuca-test-suite application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://zuca-test-suite \
	file://uio-test \
	file://sysmon \
	file://usb-bist \
	file://usb-reset \
	file://DP-bist \
	file://zuca-init \
	"

inherit update-rc.d

S = "${WORKDIR}"

inherit update-rc.d
INITSCRIPT_NAME = "zuca-init"
INITSCRIPT_PARAMS = "start 99 S ."

do_install() {
	install -d ${D}/${bindir}
	install -m 0755 ${S}/zuca-test-suite ${D}/${bindir}
	install -m 0755 ${S}/uio-test ${D}/${bindir}
	install -m 0755 ${S}/sysmon ${D}/${bindir}
	install -m 0755 ${S}/usb-bist ${D}/${bindir}
	install -m 0755 ${S}/usb-reset ${D}/${bindir}
	install -m 0755 ${S}/DP-bist ${D}/${bindir}

	#config
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/zuca-init ${D}${sysconfdir}/init.d/zuca-init
}

FILES_${PN} += "${sysconfdir}/*"
