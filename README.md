# nrc7292-buildroot
This is a repository for testing the operation of NRC7292 driver with various HW platforms and various versions of kernel.
The repository uses Buildroot 2020.08
Now 32-bit and 64-bit version of kernel  4.14.114 are tested on Rapsberry Pi 3.

The directory configs/br-2020.08 contains config files. You should unpack [Buildroot 2020.08](https://buildroot.org/downloads/buildroot-2020.08.tar.bz2) into the top level of cloned repository.
Then you should copy the appropriate config file as `buildroot-2020.08/.config`.
After compilation of the image, you should copy the generated `output/images/sdcard.img` to the SD card (with dd).
Then mount the SD card and modify the files on the first (boot) partition.

1. Copy the files from the `extra` subdirectory to the `overlays` directory in that partition.
2. At the end of the `config.txt` file you should place:
```
enable_uart=1
dtoverlay=pi3-disable-bt
dtoverlay=newracom
```
(remove `dtoverlay=miniuart-bt`).

Then unmount the SD card, put it into the RPi3 and boot it.
To test you should do:
```
modprobe spi-bcm2835
modprobe nrc fw_name=nrc7292_cspi.bin bd_name=nrc7292_bd.dat hifspeed=16000000
ifconfig wlan0 up
iwlist wlan0 scan
```
It should find the AP (if there is any).
Of course you should try to set the parameters:
```
cli_app set txpwr 23
cli_app set maxagg 1 8
cli_app set gi short
```
(For me it works with 32-bit system, but fails with 64-bit system)
Of course finally you may try to start the wpa_supplicant (its configuration is not yet put into the repository).
