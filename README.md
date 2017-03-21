# android_device_nvidia_tegra_k1
export TOP=`pwd`
cd vendor/nvidia/licensed-binaries
./extract-nv-bins.sh "I ACCEPT"
cd $TOP
source build/envsetup.sh
setpaths
lunch full_foster-userdebug
