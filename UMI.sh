#!/bin/bash

echo "
######################################################
#                                                    #
#                Shizuka |UMI| Kernel                #
#                                                    #
#                Nicklas Van Dam @XDA                #
#                                                    #
#	Side kernel development of HANA Kernel	     #
#						     #
#	      Hana / 花 Kernel Development	     #
######################################################"

echo "###Cleaning old build"
make clean && make mrproper

echo "
###Running GCC Toolchains 5.4.1 (Linaro Toolchains)"
export ARCH=arm
export CROSS_COMPILE=/home/Hana/Linaro_5.4.1/bin/arm-cortex_a15-linux-gnueabihf-

echo "
###Building |UMI| Kernel"
make ARCH=arm umi_nicki_defconfig
make ARCH=arm CROSS_COMPILE=/home/Hana/Linaro_5.4.1/bin/arm-cortex_a15-linux-gnueabihf- > UMI.log

echo "
##Creating Temporary Modules kernel"
mkdir modules
cp arch/arm/boot/zImage modules
find . -name "*.ko" -exec cp {} modules \;
cd modules
/home/Hana/Linaro_5.4.1/bin/arm-cortex_a15-linux-gnueabihf-strip --strip-unneeded *.ko
cd /home/Hana/android_kernel_sony_msm8x27-cm-14.1
mv modules TEMP

echo "
##Checking Kernel Process"
./UMI_Checker.sh
