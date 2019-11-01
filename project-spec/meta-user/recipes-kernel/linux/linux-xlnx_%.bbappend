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
            file://user_2019-08-15-16-24-00.cfg \
            file://user_2019-08-19-15-47-00.cfg \
            file://user_2019-11-01-12-02-00.cfg \
            "

SRC_URI += "file://0001-Remove-wilc1000.patch \
	file://0002-staging-wilc-Add-driver-starting-with-15_3_1.patch \
	file://0003-staging-wilc1000-Fix-kernel-version-check-for-needs_.patch \
	file://0004-staging-wilc1000-return-linux-err-codes-from-wilc_wl.patch \
	file://0005-Assign-wlan0-interface-the-original-mac-address.patch \
	file://0006-staging-wilc1000-Remove-get_drv_hndl_by_ifc.patch \
	file://0007-staging-wilc1000-Reduce-verbosity-of-non-critical-lo.patch \
	file://0008-staging-wilc1000-Add-driver-verision.patch \
	file://0009-staging-wilc1000-avoid-twice-IRQ-handler-execution-f.patch \
	file://0010-staging-wilc1000-Rename-device-tree-binding-referenc.patch \
	file://0011-staging-dt-bindings-wilc1000-add-optional-rtc_clk-pr.patch \
	file://0012-staging-wilc1000-look-for-rtc_clk-clock.patch \
	file://0013-staging-wilc1000-fix-PTR_ERR_OR_ZERO-implicit-declar.patch \
	file://0014-staging-wilc1000-look-for-rtc_clk-clock-in-spi-mode.patch \
	file://0015-staging-wilc1000-use-RCU-list-to-maintain-vif-interf.patch \
	file://0016-staging-wilc1000-fix-debug-thread-recovery.patch \
	file://0017-staging-wilc1000-don-t-use-wdev-while-setting-tx-pow.patch \
	file://0018-staging-wilc-Turn-down-verbosity.patch \
	"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

