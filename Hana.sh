#!/bin/bash

echo "
######################################################
#                                                    #
#                    Hana Kernel                     #
#                                                    #
#                Nicklas Van Dam @XDA                #
#                                                    #
#	Side kernel development of HANA Kernel	     #
#						     #
#	      Hana / 花 Kernel Development	     #
######################################################"

echo "
###Running GCC Toolchains 4.9 (Google GCC)"
export ARCH=arm
export CROSS_COMPILE=/home/Hana/Downloads/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

echo "
###Building Hana Kernel"
make ARCH=arm hana_kernel_nicki_defconfig
make ARCH=arm CROSS_COMPILE=/home/Hana/Downloads/arm-linux-androideabi-4.9/bin/arm-linux-androideabi- > Hana.log

echo "
##Creating Temporary Modules kernel"
mkdir modules
cp arch/arm/boot/zImage modules
find . -name "*.ko" -exec cp {} modules \;
cd modules
/home/Hana/Downloads/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-strip --strip-unneeded *.ko
cd /home/Hana/android_kernel_sony_msm8x27-cm-14.1
mv modules TEMP

echo "
##Checking Kernel Process"
./Hana_Checker.sh
