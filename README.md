# CI Scripts

This repository contains tools and resources to build
[Pharo](http://www.pharo.org) and related tools.

# Pharo slaves setup
## Building slaves from Pharo templates
### Linux and OS X slaves
Just use templates to create slaves. Nothing more to do.
### Windows slave
Use the template and follow steps 4 and 5 of 'Building slaves / templates from scratch'

## Building slaves / templates from scratch
### Linux slave
1. Create the slave from the last featured Ubuntu 64-bits template by resizing the root disk size to 120 Go. 
2. Pharo (32-bits) requires installation of 32-bits libraries to run on 64-bits Linux distributions
```bash
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libx11-6:i386
sudo apt-get install libgl1-mesa-glx:i386
sudo apt-get install libfontconfig1:i386
sudo apt-get install libssl1.0.0:i386
```
3. Install extra-libs needed by Pharo:
```bash
sudo apt-get install curl
sudo apt-get install libcairo2:i386
```
libcairo 32-bits version is needed by some UI tests.
4. Add and prepare the partition for builds
```bash
sudo fdisk -l
sudo fdisk /dev/vda [replace vda with the disk with the free space]
```
n - p - enter - enter - p - w
```bash
sudo mkfs -t ext4 /dev/vda3 [replace vda3 with the disk partition with the free space]
```
5. Remove old workspace
```bash
rm -rf workspace
```
6. Mount the new partition and get it mounted at startup
```bash
ls -l /dev/disk/by-uuid/
sudo vi /etc/fstab
```
Copy-paste the UUID of the newly created partition (check the target of the symlink), then add this line to the fstab:
```bash
# /builds
UUID=paste-UUID-here	/builds	ext4	defaults	1	2
```

### Windows slave
1. Create the slave from the featured "BETA - Windows 7 64b-Visual-V25"  template by resizing the root disk size to 120 Go. 
2. install MSys (could be already installed)
3. install additional packages:
Run Windowd terminal (cmd), then:
```bash
bash
mingw-get install msys-mktemp # needed by zero-conf
mingw-get install msys-coreutils-ext # readlink is also needed by zero-conf
```
4. Add and prepare the disk for builds
- Open the 'Create and format hard disk partitions' tool from the control panel
- Select the free space on the disk visualization
- Click on 'New simple volume ...'
  - Use maximum volume size,
  - Drive Letter: 'E'
  - Volume Label: 'Builds'
  - File System: NTFS
  - Allocation Unit Size: default
  - Tick 'Perform a quick format'
5. Configure your node in Jenkins to build in the 'E:\builds' folder

### OS X slave
Pharo does not run properly in headless mode and needs an access to a Window manager.
To avoid the following error `_RegisterApplication(), FAILED TO establish the default connection to the WindowServer, _CGSDefaultConnection() is NULL.`, we need to workaround this problem and provide a proper Window manager. Two things must happen to access the Window manager:
 - a user needs to be logged in using graphical mode
 - the user connecting through ssh should be the same as the one that is logged in
 
In our case, the user logging through ssh is the one connecting from the jenkins master. We need to add autologin at startup for him.
For this, follow the next instructions:
 - Connect to your OS X slave in graphical mode: https://wiki.inria.fr/ciportal/Slaves_Access_Tutorial#Connecting_to_a_MacOSX_slave_.28graphical_way.29
https://www.howtogeek.com/180953/3-free-ways-to-remotely-connect-to-your-macs-desktop/

 - Set autologin for the user you want: https://support.apple.com/en-us/HT201476

 - Reboot the machine
