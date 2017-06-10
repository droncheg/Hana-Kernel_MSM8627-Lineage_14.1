#!/bin/bash

cp TEMP/Pre-built_ZIP/Template/Hana_Kernel.zip TEMP/Pre-built_ZIP/ZIP/Hana_Kernel.zip
cd TEMP/Pre-built_ZIP/ZIP
unzip Hana_Kernel.zip
cd /home/Hana/android_kernel_sony_msm8x27-cm-14.1
mv TEMP/modules/zImage TEMP/Pre-built_ZIP/ZIP/tmp/kernel/boot.img-zImage
mv TEMP/modules TEMP/Pre-built_ZIP/ZIP/tmp
cd TEMP/Pre-built_ZIP/ZIP
rm Hana_Kernel.zip
zip -r Hana_Kernel *
rm -rfv META-INF
rm -rfv system 
rm -rfv tmp
mv Hana_Kernel.zip /home/Hana/android_kernel_sony_msm8x27-cm-14.1/TEMP/Pre-built_ZIP/Sign/Hana_Kernel.zip
cd /home/Hana/android_kernel_sony_msm8x27-cm-14.1/TEMP/Pre-built_ZIP/Sign
java -jar signapk.jar signature-key.Nicklas@XDA.x509.pem signature-key.Nicklas@XDA.pk8 Hana_Kernel.zip Hana_Kernel-nicki-signed.zip
mv  Hana_Kernel-nicki-signed.zip /home/Hana/Result/Build/Stable/Hana_Kernel-nicki-signed.zip
rm Hana_Kernel.zip

echo "Hana Kernel Completed to build"
echo "Thanks to XDA - Developers"
echo "プロジェクト　ラブライブ | Project HANA (2016)"
echo "あろがとう　ございます μ's !!!"
echo "Hana / 花 Kernel Development"
