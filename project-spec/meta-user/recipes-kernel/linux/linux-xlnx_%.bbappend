SRC_URI += "file://0001-Remove-wilc1000.patch \
       file://0002-staging-wilc-Add-driver-starting-with-15_3_1.patch \
       "


SRC_URI += "file://devtool-fragment.cfg"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

