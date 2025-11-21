# Virtual Machine Setup Guide

## 🎯 Why Use a Virtual Machine?

Using a virtual machine (VM) for learning is **essential** because:
- **Safety**: You can experiment without breaking your main system
- **Isolation**: Mistakes are contained within the VM
- **Snapshots**: Save your VM state and restore if something goes wrong
- **Practice**: Perfect for learning Linux system administration
- **Reset**: Easy to start fresh if needed

## 📋 Prerequisites

- **macOS** (10.13 or later) or **Linux** (most distributions)
- At least **8GB RAM** (16GB recommended)
- At least **50GB free disk space**
- Administrator/sudo access

## 🛠️ Step 1: Install VirtualBox

### macOS

1. **Download VirtualBox**
   - Go to: https://www.virtualbox.org/wiki/Downloads
   - Download: **VirtualBox for macOS hosts**
   - File: `VirtualBox-7.x.x-OSX.dmg`

2. **Install VirtualBox**
   ```bash
   # Open the downloaded .dmg file
   # Double-click "VirtualBox.pkg"
   # Follow the installation wizard
   # You may need to allow the installation in System Preferences > Security
   ```

3. **Verify Installation**
   ```bash
   # Open Terminal and check
   VBoxManage --version
   # Should show version number like: 7.0.x
   ```

### Linux

#### Ubuntu/Debian
```bash
# Update package list
sudo apt update

# Install VirtualBox
sudo apt install virtualbox virtualbox-ext-pack

# Verify installation
VBoxManage --version
```

#### Fedora/RHEL/CentOS
```bash
# Install VirtualBox
sudo dnf install VirtualBox

# Or using yum
sudo yum install VirtualBox
```

#### Arch Linux
```bash
# Install VirtualBox
sudo pacman -S virtualbox virtualbox-host-modules-arch
```

## 🐧 Step 2: Download Linux ISO

We recommend **Ubuntu Server 24.04 LTS** (or 22.04 LTS) for learning:

1. **Download Ubuntu Server**
   - Go to: https://ubuntu.com/download/server
   - Download: **Ubuntu Server 24.04 LTS** (or 22.04 LTS)
   - **Important**: 
     - For **Intel/AMD Macs**: Download `ubuntu-24.04.x-live-server-amd64.iso` (~1.5GB)
     - For **Apple Silicon (M1/M2/M3) Macs**: Download `ubuntu-24.04.x-live-server-arm64.iso` (~1.5GB)
   - Check your Mac's architecture: `uname -m` (shows `x86_64` for Intel or `arm64` for Apple Silicon)

2. **Why Ubuntu Server?**
   - Widely used in cloud environments
   - Good documentation
   - Stable and reliable
   - No GUI (better for learning command line)

**Alternative**: If you prefer a different distribution:
- **Debian**: https://www.debian.org/download
- **CentOS Stream**: https://www.centos.org/download
- **Rocky Linux**: https://rockylinux.org/download

## 🖥️ Step 3: Create Your Virtual Machine

### Create New VM

1. **Open VirtualBox**
   - Launch VirtualBox from Applications (macOS) or Applications menu (Linux)

2. **Click "New"**
   - Name: `cloud-training-vm` (or your preferred name)
   - Type: **Linux**
   - Version: **Ubuntu (64-bit)** or **Ubuntu 24.04 LTS (64-bit)**
   - **Note**: If VirtualBox shows "ARM 64-bit" but you downloaded amd64 ISO, that's okay - you'll install manually
   - Click **Next**

3. **Allocate Memory (RAM)**
   - **Recommended**: 2048 MB (2 GB)
   - **Minimum**: 1024 MB (1 GB)
   - **Maximum**: Don't exceed half your total RAM
   - Click **Next**

4. **Hardware Configuration**
   - **Base Memory**: 2048 MB (2 GB) - adjust slider if needed
   - **Number of CPUs**: **2-4 CPUs** (recommended: 2 if you have 4+ cores, 4 if you have 8+ cores)
   - **Disk Size**: **25 GB** (minimum) or **40 GB** (recommended)
   - **Use EFI**: ✅ Check this box (recommended for Ubuntu 24.04)
   - Click **Next**

5. **Create Virtual Hard Disk**
   - Select: **Create a virtual hard disk now**
   - Click **Create**

6. **Hard Disk File Type**
   - Select: **VDI (VirtualBox Disk Image)**
   - Click **Next**

7. **Storage on Physical Hard Disk**
   - Select: **Dynamically allocated** (recommended)
   - Click **Next**

8. **File Location and Size**
   - Size: **25 GB** (minimum) or **40 GB** (recommended)
   - Location: Keep default (`/Users/yourname/VirtualBox VMs/`) or choose custom location
   - Click **Create**

**Note**: 
- If VirtualBox detects the OS and offers **unattended installation**, you can use it (easier option - see below)
- If VirtualBox shows "can't install an OS from the selected ISO", you'll install Ubuntu manually (see Step 4)

### Option A: Unattended Installation (Recommended if Available)

If VirtualBox detected your OS and shows the "Set up unattended guest OS installation" screen:

1. **User Name and Password**
   - **User Name**: Change `vboxuser` to `student` (or your preferred username)
   - **Password**: Enter a **strong password** (you'll need this to log in)
   - **Confirm Password**: Enter the same password again
   - **Note**: Remember this password - you'll use it to log in!

2. **Install Guest Additions** (Optional but Recommended)
   - ✅ Check **Install Guest Additions** (improves performance and enables features)
   - The Guest Additions ISO path should be auto-detected

3. **OS Installation Options**
   - **Product Key**: Leave empty (not needed for Ubuntu)
   - **Host Name**: `cloud-training-vm` (or your preferred name)
   - **Domain Name**: `myguest.virtualbox.org` (or leave default)
   - **Install in Background**: Leave unchecked (so you can see the installation progress)

4. **Click Next**
   - VirtualBox will create the VM and start the installation automatically
   - You'll see the installation progress
   - This takes about 10-15 minutes

5. **After Installation**
   - The VM will automatically reboot
   - You'll see the login prompt
   - Log in with your username (`student`) and password

**Skip to Step 5: Verify Installation** if you used unattended installation.

### Option B: Manual Installation (If Unattended Not Available)

### Configure VM Settings (Manual Installation Path)

1. **Select your VM** and click **Settings**

2. **System > Processor**
   - Processors: **2-4** (match what you set during creation)
   - Enable: **Enable PAE/NX** (if available)
   - **Extended Features**: Enable **Enable Nested VT-x/AMD-V** (if available, improves performance)
   - Click **OK**

3. **Storage**
   - Click on **Empty** under Controller: IDE (or SATA Controller)
   - Click the **CD/DVD icon** on the right (or the disk icon)
   - Click **Choose a disk file** (or **Choose...**)
   - Navigate to your Downloads folder
   - Select your downloaded Ubuntu ISO file (`ubuntu-24.04.x-live-server-amd64.iso`)
   - Click **Open** (or **OK**)
   - Verify the ISO appears in the storage list
   - Click **OK**

4. **Network** (Important!)
   - Adapter 1: **NAT** (default - allows internet access)
   - This is fine for most exercises
   - Click **OK**

5. **Optional: Shared Folders**
   - Shared Folders > Add new shared folder
   - Folder Path: Choose a folder on your host
   - Folder Name: `shared`
   - Enable: **Auto-mount** and **Make Permanent**
   - Click **OK**

## 🚀 Step 4: Install Ubuntu Server (Manual Installation)

**Note**: Only follow this if you didn't use unattended installation in Step 3.

1. **Start the VM**
   - Select your VM
   - Click **Start** (green arrow)

2. **Installation Process**
   - The VM will boot from the ISO
   - Follow the Ubuntu Server installation wizard:
     - **Language**: Choose your language
     - **Keyboard**: Choose your keyboard layout
     - **Network**: Use default (DHCP)
     - **Proxy**: Leave empty (unless you need one)
     - **Ubuntu Archive Mirror**: Use default
     - **Storage**: Use entire disk (this is safe - it's the VM disk)
     - **Profile Setup**: 
       - Your name: `student` (or your choice)
       - Server name: `cloud-training` (or your choice)
       - Username: `student` (or your choice)
       - Password: **Choose a strong password** (you'll use this)
     - **SSH Setup**: Enable **Install OpenSSH server** (important!)
     - **Snaps**: Choose what you want or skip
     - **Installation**: Wait for installation to complete (~10-15 minutes)

3. **After Installation**
   - Click **Reboot Now**
   - Remove the ISO: Settings > Storage > Remove disk
   - VM will reboot and show login prompt

4. **First Login**
   ```
   cloud-training login: student
   Password: [your password]
   ```

## ✅ Step 5: Verify Installation

After logging in, verify everything works:

```bash
# Check system information
uname -a

# Check network connectivity
ping -c 3 8.8.8.8

# Check disk space
df -h

# Check memory
free -h

# Update system (recommended)
sudo apt update
sudo apt upgrade -y
```

## 📸 Step 6: Create Your First Snapshot

**Snapshots are your safety net!** Create one now:

1. **In VirtualBox**
   - Select your VM (make sure it's shut down)
   - Click **Snapshots** tab
   - Click **Take** (camera icon)
   - Name: `Fresh Install`
   - Description: `Clean Ubuntu Server 22.04 installation`
   - Click **OK**

2. **Why Snapshots?**
   - Before risky operations, create a snapshot
   - If something breaks, restore the snapshot
   - You can have multiple snapshots

3. **Restore Snapshot** (if needed)
   - Right-click on snapshot
   - Select **Restore Snapshot**
   - VM will return to that state

## 🔧 Step 7: Basic Configuration

### Enable SSH Access (Optional but Recommended)

If you want to SSH from your host machine:

1. **In VM**, check IP address:
   ```bash
   ip addr show
   # Look for inet address (usually 10.0.2.15 with NAT)
   ```

2. **Configure Port Forwarding** (in VirtualBox)
   - VM Settings > Network > Adapter 1 > Advanced
   - Click **Port Forwarding**
   - Add rule:
     - Name: `SSH`
     - Protocol: `TCP`
     - Host IP: `127.0.0.1`
     - Host Port: `2222`
     - Guest IP: (leave empty)
     - Guest Port: `22`
   - Click **OK**

3. **SSH from Host**
   ```bash
   # From your Mac/Linux terminal
   ssh student@127.0.0.1 -p 2222
   ```

### Install Useful Tools

```bash
# Install common utilities
sudo apt install -y \
    vim \
    nano \
    curl \
    wget \
    git \
    tree \
    htop \
    net-tools \
    iputils-ping \
    traceroute

# Verify installations
which vim nano curl git
```

## 🎓 Step 8: Ready for Exercises!

Your VM is now ready. You can:

1. **Start the VM** whenever you want to practice
2. **Create snapshots** before starting exercises
3. **Experiment freely** - you can always restore
4. **Follow exercises** from `exercises/01-foundations/`

## 💡 Tips and Best Practices

### Before Starting Exercises

1. **Create a Snapshot**
   ```bash
   # In VirtualBox, create snapshot named:
   # "Before Exercise 1" or "Clean State"
   ```

2. **Take Notes**
   - Document what you learn
   - Save useful commands
   - Note any issues and solutions

### During Exercises

1. **If Something Breaks**
   - Don't panic!
   - Restore your snapshot
   - Try again

2. **Regular Snapshots**
   - Create snapshot after completing each major exercise
   - Name them descriptively: "After Exercise 2", etc.

3. **Backup Important Work**
   - Use shared folders for scripts you create
   - Or use Git to version control your work

### VM Management

**Start VM:**
- Select VM > Click **Start**

**Shut Down VM:**
- In VM: `sudo shutdown -h now`
- Or: VirtualBox > Machine > ACPI Shutdown

**Pause VM:**
- VirtualBox > Machine > Pause (saves state)

**Clone VM:**
- Right-click VM > Clone (for testing different configurations)

## 🐛 Troubleshooting

### VM Won't Start

**macOS:**
```bash
# Check if VirtualBox kernel extensions are allowed
# System Preferences > Security & Privacy > General
# Allow Oracle extensions if prompted
```

**Linux:**
```bash
# Add user to vboxusers group
sudo usermod -aG vboxusers $USER
# Log out and back in
```

### No Internet in VM

1. Check VM Settings > Network > Adapter 1 is enabled
2. Adapter should be set to **NAT**
3. In VM: `sudo systemctl restart networking`

### VM is Slow

1. Increase RAM allocation (if you have enough)
2. Enable hardware acceleration in VM Settings
3. Close unnecessary applications on host

### Can't Copy/Paste Between Host and VM

1. VM Settings > General > Advanced
2. Enable **Shared Clipboard**: Bidirectional
3. Install Guest Additions (see below)

### Install VirtualBox Guest Additions (Optional)

Improves performance and enables features:

```bash
# In VM
sudo apt update
sudo apt install -y build-essential dkms linux-headers-$(uname -r)

# In VirtualBox menu: Devices > Insert Guest Additions CD
# In VM
sudo mount /dev/cdrom /mnt
cd /mnt
sudo ./VBoxLinuxAdditions.run
sudo reboot
```

## 📚 Next Steps

1. ✅ Your VM is set up and ready
2. 📖 Read: [Phase 1: Foundations Documentation](./docs/01-foundations.md)
3. 💻 Start: [Exercises](./exercises/01-foundations/)
4. 💡 Reference: [Examples](./examples/01-foundations/)

## 🆘 Need Help?

- **VirtualBox Documentation**: https://www.virtualbox.org/manual/
- **Ubuntu Server Guide**: https://ubuntu.com/server/docs
- **Common Issues**: Check troubleshooting section above

---

**Remember**: This VM is for learning. Experiment, break things, and learn from mistakes. That's what snapshots are for! 🚀

