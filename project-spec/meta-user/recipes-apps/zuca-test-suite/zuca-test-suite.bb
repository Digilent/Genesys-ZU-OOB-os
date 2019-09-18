#
# This file is the zuca-test-suite recipe.
#

SUMMARY = "Simple zuca-test-suite application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://zuca-test-suite \
	file://pwm-rgb-led-test \
	"

S = "${WORKDIR}"

do_install() {
	     install -d ${D}/${bindir}
	     install -m 0755 ${S}/zuca-test-suite ${D}/${bindir}
	     install -m 0755 ${S}/pwm-rgb-led-test ${D}/${bindir}
}
