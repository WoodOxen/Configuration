# Install the Proxmox VE

Configure a PC with GPU.

## Preparation

Check hardware requirements and ISO image on [promox](https://www.proxmox.com/en/proxmox-ve/get-started). Get an empty USB to install Ventoy, the ISO of PVE and all the other ISO you need for the VM machine.

## PVE Installation

Follows the instructions. Please take care of your file system.

## Configuration of GPU

1. Check BIOS of the physical PC to enable ```iommu```.
2. Add the GPU to the VM you want in ```hardware```.
3. Check [Pci passthrough](https://pve.proxmox.com/wiki/Pci_passthrough) to configure the PVE.
4. Check [NVIDIA Driver Installation Quickstart Guide](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#ubuntu-lts) to install the cuda driver. **The recommended way is to use apt-get.**

```Shell
# 1. The kernel headers and development packages for the currently running kernel can be installed with:
sudo apt-get install linux-headers-$(uname -r)

# 2. Install the CUDA repository public GPG key. This can be done via the cuda-keyring package or a manual installation of the key. The usage of apt-key is deprecated.
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb

# 3. Update the APT repository cache and install the driver using the cuda-drivers meta-package. Use the --no-install-recommends option for a lean driver install without any dependencies on X packages. This is particularly useful for headless installations on cloud instances.
sudo apt-get update
sudo apt-get -y install cuda-drivers
```

## Share ZFS with NFS

Refer to [How to Share ZFS Filesystems with NFS](https://linuxhint.com/share-zfs-filesystems-nfs/) and [here](https://zhuanlan.zhihu.com/p/81752517)

## Configure dockers

https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker
