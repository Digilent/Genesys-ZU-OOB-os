SRC_URI += "file://user_2019-07-10-11-42-00.cfg \
            file://user_2019-07-10-16-53-00.cfg \
            file://user_2019-07-11-11-49-00.cfg \
            file://user_2019-07-11-14-29-00.cfg \
            file://user_2019-07-12-13-43-00.cfg \
            file://user_2019-07-16-09-29-00.cfg \
            file://user_2019-07-24-12-18-00.cfg \
            file://user_2019-07-25-10-48-00.cfg \
            file://user_2019-08-02-08-22-00.cfg \
            file://user_2019-08-05-11-37-00.cfg \
            file://user_2019-08-06-14-32-00.cfg \
            file://user_2019-08-09-09-23-00.cfg \
            "
#SRC_URI += "file://0001-wilc1000-v3.patch"
#SRC_URI += "file://0001-wilc1000-v2.patch"
SRC_URI += "file://0001-wilc1000.patch"
#SRC_URI += "file://0001-wilc1000-update.patch"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

