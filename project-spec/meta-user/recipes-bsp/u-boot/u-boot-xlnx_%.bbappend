FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://platform-top.h \
            file://zynq-MAC-in-flash.patch \
            file://mmc_debug.patch \
            file://user_2019-10-17-11-48-00.cfg \
            file://user_2019-10-02-14-10-00.cfg \
            file://user_2019-11-11-13-46-00.cfg \
            file://user_2020-04-01-10-17-00.cfg \
            "
