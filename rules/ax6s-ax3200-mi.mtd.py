# https://miwifi.dev/ssh
# https://openwrt.org/toh/xiaomi/ax3200
# https://github.com/YangWang92/AX6S-unlock/raw/master/miwifi_rb03_firmware_stable_1.2.7.bin
#1.If your device has telnet enabled from factory, you can skip to step 3 (click here to access your device and check if telnet is enabled).
#2.If your device does not have telnet enabled from factory and it is a Redmi AX6 (RB03 model), you can enable telnet by flashing stock “closed beta” firmware labelled miwifi_rb03_firmware_stable_1.2.7_closedbeta.bin. (MD5: 5eedf1632ac97bb5a6bb072c08603ed7). If your device is a Xiaomi AX3200 (RB01 model) and does not have telnet enabled from factory, stop here - unfortunately, there is no known way to enable telnet on this model other than the UART flash or “netmode: 4” methods.
#3.Download this Python program and save to your local disk with the name unlock_pwd.py. Then execute this program by running the command python3 unlock_pwd.py <S/N> by replacing <S/N> with the actual serial number from your device (you need to have Python pre-installed on your computer). You can locate the serial number in the label beneath your router.
#4.Open a telnet session to your device (using a telnet client such as Putty) and login with username “root” and the password from the previous step. The default IP address of the stock firmware is 192.168.31.1.
#5.Execute the following commands to prepare device for OpenWrt flashing: IMPORTANT: the commands below are valid for the original Xiaomi bootloader (2021). Newer devices have a different bootloader (2022) that may require different commands. Please refer to this post in the forum for more details.

	# nvram set ssh_en=1 & nvram set uart_en=1 & nvram set boot_wait=on & nvram set bootdelay=3 & nvram set flag_try_sys1_failed=0 & nvram set flag_try_sys2_failed=1
	# nvram set flag_boot_rootfs=0 & nvram set "boot_fw1=run boot_rd_img;bootm"
	# nvram set flag_boot_success=1 & nvram commit & /etc/init.d/dropbear enable & /etc/init.d/dropbear start

#6.Rename the file openwrt-mediatek-mt7622-xiaomi_redmi-router-ax6s-squashfs-factory.bin you previously downloaded to your computer to factory.bin
#7.On your computer, in the same directory where the file factory.bin is located, run the following command (you need to have Python pre-installed on your computer):
	# python -m http.server
#8.On the telnet session to your router, execute the following commands to flash OpenWrt:
	# cd /tmp
	# wget http://<IP address of your computer>:8000/factory.bin
	# mtd -r write factory.bin firmware
#9.After flashing is complete, your device should reboot to OpenWrt. Notice that the device IP will change to the OpenWrt default IP address which is 192.168.1.1 after it reboots.

#!/usr/bin/env python3
import sys
import hashlib

if sys.version_info < (3,7):
    print("python version is not supported", file=sys.stderr)
    sys.exit(1)

# credit goes to zhoujiazhao:
# https://blog.csdn.net/zhoujiazhao/article/details/102578244

salt = {'r1d': 'A2E371B0-B34B-48A5-8C40-A7133F3B5D88',
        'others': 'd44fb0960aa0-a5e6-4a30-250f-6d2df50a'}


def get_salt(sn):
    if "/" not in sn:
        return salt["r1d"]

    return "-".join(reversed(salt["others"].split("-")))


def calc_passwd(sn):
    passwd = sn + get_salt(sn)
    m = hashlib.md5(passwd.encode())
    return m.hexdigest()[:8]


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <S/N>")
        sys.exit(1)

    serial = sys.argv[1]
    print(calc_passwd(serial))
