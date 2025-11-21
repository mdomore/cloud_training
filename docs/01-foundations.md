# Phase 1: Foundations

## Overview



## Table of Contents

  - [Overview](#overview)
  - [Learning Objectives](#learning-objectives)
  - [Structure](#structure)
  - [Prerequisites](#prerequisites)
  - [Estimated Time](#estimated-time)
  - [How to Use This Phase](#how-to-use-this-phase)
  - [System Administration](#system-administration)
  - [Purpose](#purpose)
  - [Structure](#structure)
  - [Topics Covered](#topics-covered)
    - [1. Linux Fundamentals](#1-linux-fundamentals)
    - [2. Shell Scripting](#2-shell-scripting)
    - [3. System Configuration](#3-system-configuration)
    - [4. Security Basics](#4-security-basics)
  - [How to Use This Section](#how-to-use-this-section)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
    - [Linux Fundamentals](#linux-fundamentals)
  - [Linux Fundamentals - Purpose](#linux-fundamentals---purpose)
  - [Linux Fundamentals - Learning Objectives](#linux-fundamentals---learning-objectives)
  - [1. File System Hierarchy](#1-file-system-hierarchy)
  - [2. Users, Groups, and Permissions](#2-users-groups-and-permissions)
  - [2.5. Understanding sudo](#25-understanding-sudo)
  - [3. Process Management](#3-process-management)
    - [Process Monitoring Examples](#process-monitoring-examples)
  - [4. System Services (systemd)](#4-system-services-systemd)
  - [Linux Fundamentals - Practical Exercises](#linux-fundamentals---practical-exercises)
  - [Common Commands Reference](#common-commands-reference)
  - [Linux Fundamentals - Notes](#linux-fundamentals---notes)
    - [Shell Scripting](#shell-scripting)
  - [Shell Scripting - Purpose](#shell-scripting---purpose)
  - [Shell Scripting - Learning Objectives](#shell-scripting---learning-objectives)
  - [1. Shell Basics](#1-shell-basics)
  - [2. Variables](#2-variables)
  - [3. Conditionals](#3-conditionals)
  - [4. Loops](#4-loops)
  - [5. Functions](#5-functions)
  - [6. Error Handling](#6-error-handling)
  - [7. Input/Output](#7-inputoutput)
  - [8. Advanced Topics](#8-advanced-topics)
  - [Complete Script Examples](#complete-script-examples)
    - [Example 4: Log Monitoring Script](#example-4-log-monitoring-script)
  - [Scripting Best Practices Summary](#scripting-best-practices-summary)
  - [Shell Scripting - Notes](#shell-scripting---notes)
    - [System Configuration](#system-configuration)
  - [System Configuration - Purpose](#system-configuration---purpose)
  - [System Configuration - Learning Objectives](#system-configuration---learning-objectives)
  - [Topics to Cover](#topics-to-cover)
  - [Learning Resources](#learning-resources)
  - [System Configuration - Practical Exercises](#system-configuration---practical-exercises)
  - [Configuration Files Reference](#configuration-files-reference)
  - [Detailed Examples and Commands](#detailed-examples-and-commands)
  - [Troubleshooting Guide](#troubleshooting-guide)
  - [System Configuration - Notes](#system-configuration---notes)
    - [Security Basics](#security-basics)
  - [Security Basics - Purpose](#security-basics---purpose)
  - [Security Basics - Learning Objectives](#security-basics---learning-objectives)
  - [Topics to Cover](#topics-to-cover)
  - [Learning Resources](#learning-resources)
  - [Security Basics - Practical Exercises](#security-basics---practical-exercises)
  - [Security Checklist](#security-checklist)
  - [Configuration Files Reference](#configuration-files-reference)
  - [Detailed Examples and Configurations](#detailed-examples-and-configurations)
  - [Security Checklist](#security-checklist)
  - [Troubleshooting Security Issues](#troubleshooting-security-issues)
  - [Security Basics - Notes](#security-basics---notes)
  - [Networking](#networking)
  - [Networking - Purpose](#networking---purpose)
  - [Topics Covered](#topics-covered)
    - [4. Cloud Networking Basics](#4-cloud-networking-basics)
  - [Learning Resources](#learning-resources)
  - [Networking - Practical Exercises](#networking---practical-exercises)
  - [Networking - Notes](#networking---notes)
  - [Development Basics](#development-basics)
  - [Development Basics - Purpose](#development-basics---purpose)
  - [Topics Covered](#topics-covered)
  - [Learning Resources](#learning-resources)
  - [Development Basics - Practical Exercises](#development-basics---practical-exercises)
  - [Development Basics - Notes](#development-basics---notes)

---


This phase establishes the fundamental knowledge required before diving into cloud technologies. Even if you have system and network experience, this phase helps clarify and solidify core concepts that are essential for cloud infrastructure.

## Learning Objectives

By the end of this phase, you should be able to:
- Understand and manage Linux systems effectively
- Comprehend network protocols and configurations
- Use version control and basic development tools
- Write simple scripts for automation

## Structure

This phase covers three main areas:
- **System Administration** - Linux fundamentals, system management, security
- **Networking** - Network protocols, DNS, routing, security
- **Development Basics** - Git, programming basics, API development

## Prerequisites

- Basic computer literacy
- **Virtual Machine Setup** (recommended for safety)
  - See: [Virtual Machine Setup Guide](../../SETUP_GUIDE.md)
  - VirtualBox installed on macOS or Linux
  - Ubuntu Server 22.04 LTS VM created
  - First snapshot created
- **OR** Access to a Linux system (if you're comfortable)

## Estimated Time

- System Administration: 2-3 weeks
- Networking: 1-2 weeks
- Development Basics: 1-2 weeks

**Total: 4-7 weeks** (depending on your existing knowledge)

## How to Use This Phase

1. **Set up your environment** (if not done yet)
   - Follow: [Virtual Machine Setup Guide](../../SETUP_GUIDE.md)
   - Create your first snapshot before starting
2. **Read through the documentation** in this file
3. **Complete the exercises**: [Exercises Directory](../../exercises/01-foundations/)
4. **Review code examples**: [Examples Directory](../../examples/01-foundations/)
5. Document your learnings and notes
6. Test your knowledge with practical exercises
7. Move to the next phase only when comfortable with the concepts

---

**Next Phase:** [Phase 2: Infrastructure as Code](../02-infrastructure/)



---

## System Administration

## Purpose

Master Linux system administration fundamentals. This knowledge is crucial for managing cloud infrastructure, containers, and automation tools.

## Structure

This section is organized into 4 main topics:

- **Linux Fundamentals** - File system, users, permissions, processes, systemd
- **Shell Scripting** - Bash/Zsh scripting, automation, best practices
- **System Configuration** - Network, packages, services, logs
- **Security Basics** - SSH, firewalls, access control, file security

## Topics Covered

### 1. Linux Fundamentals
- File system hierarchy
- Users, groups, and permissions
- Process management
- System services (systemd)

### 2. Shell Scripting
- Bash/Zsh basics
- Variables, conditionals, loops
- Functions and error handling
- Scripting best practices

### 3. System Configuration
- Network configuration
- Package management
- Service management
- Log management

### 4. Security Basics
- SSH configuration and hardening
- Firewall management (UFW, firewalld)
- User access control
- File permissions and ACLs

## How to Use This Section

1. **Start with Linux Fundamentals** - Build your base knowledge
2. **Learn Shell Scripting** - Essential for automation
3. **Master System Configuration** - Configure and manage systems
4. **Secure Your Systems** - Implement security best practices

This documentation contains:
- Detailed learning objectives
- Topics to cover with explanations
- Learning resources
- Practical exercises
- Space for notes and documentation

## Learning Resources

- Linux command-line tutorials
- System administration guides
- Shell scripting tutorials
- Each section has specific resources

## Practical Exercises

**📝 Complete exercises in:** [exercises/01-foundations/](../../exercises/01-foundations/)

Each topic has specific exercises. Overall goals:
1. Set up a Linux server from scratch
2. Configure network interfaces
3. Create and manage users/groups
4. Write automation scripts
5. Secure a Linux system

**💡 Reference examples in:** [examples/01-foundations/](../../examples/01-foundations/)

## Notes

Use the Notes sections throughout this documentation for documenting your learnings. Include:
- Useful commands and their explanations
- Configuration examples
- Troubleshooting scenarios
- Personal notes and insights

---

### Linux Fundamentals

## Linux Fundamentals - Purpose

Learn the essential Linux concepts and commands needed for system administration and cloud infrastructure management. This section provides comprehensive coverage of Linux fundamentals with detailed explanations and practical examples.

## Linux Fundamentals - Learning Objectives

By the end of this section, you should be able to:
- Navigate and understand the Linux file system hierarchy
- Manage users, groups, and file permissions
- Understand and manage processes
- Work with systemd services
- Apply this knowledge to cloud infrastructure management

---

## 1. File System Hierarchy

### Understanding the Linux File System

Linux uses a hierarchical file system structure starting from the root directory (`/`). Unlike Windows, everything in Linux is a file or directory, including devices and processes.

### Standard Directory Structure

#### `/` (Root Directory)
The top-level directory. All other directories branch from here.

```bash
# View root directory contents
ls -la /
```

#### `/bin` and `/sbin` - Essential Binaries
- **`/bin`**: Essential user binaries (commands like `ls`, `cp`, `mv`, `bash`)
- **`/sbin`**: Essential system binaries (commands like `ifconfig`, `fdisk`, `init`)
- These directories contain commands needed for system boot and repair

```bash
# List binaries in /bin
ls /bin

# Check if a command is in /bin
which ls
```

#### `/etc` - Configuration Files
Contains system-wide configuration files. Critical for system administration.

**Important files:**
- `/etc/passwd` - User accounts
- `/etc/shadow` - Encrypted passwords
- `/etc/group` - Group definitions
- `/etc/hosts` - Hostname resolution
- `/etc/fstab` - File system table
- `/etc/ssh/sshd_config` - SSH server config

```bash
# View all configuration files
ls -la /etc

# Edit a configuration file (use appropriate editor)
sudo nano /etc/hosts
```

#### `/home` - User Home Directories
Each user has a home directory under `/home/username`. Contains user-specific files and configurations.

```bash
# Navigate to your home directory
cd ~
# or
cd $HOME

# List home directories
ls /home

# View your home directory path
echo $HOME
```

#### `/var` - Variable Data
Contains files that change during system operation:
- `/var/log` - Log files
- `/var/cache` - Cache files
- `/var/spool` - Spool files (mail, print jobs)
- `/var/tmp` - Temporary files

```bash
# View log files
ls -lh /var/log

# Check disk usage in /var
du -sh /var/*
```

#### `/tmp` - Temporary Files
Temporary files that are typically deleted on reboot. All users can write here.

```bash
# Create a temporary file
touch /tmp/test_file.txt

# Files in /tmp are often cleared on reboot
```

#### `/usr` - User Programs
Contains user programs and data:
- `/usr/bin` - User binaries
- `/usr/sbin` - System binaries for users
- `/usr/lib` - Libraries
- `/usr/share` - Shared data
- `/usr/local` - Locally installed software

```bash
# Most commands are in /usr/bin
ls /usr/bin | head -20
```

#### `/opt` - Optional Software
Third-party or optional software packages.

```bash
# Check what's installed in /opt
ls -la /opt
```

#### `/proc` and `/sys` - Virtual File Systems
- **`/proc`**: Process information (virtual, not on disk)
  - `/proc/cpuinfo` - CPU information
  - `/proc/meminfo` - Memory information
  - `/proc/version` - Kernel version
  - `/proc/[pid]/` - Process-specific information

- **`/sys`**: System information and configuration

```bash
# View CPU information
cat /proc/cpuinfo

# View memory information
cat /proc/meminfo

# View kernel version
cat /proc/version

# List all processes (PIDs are directories)
ls /proc | grep -E '^[0-9]+$'
```

### Key Navigation Commands

#### `ls` - List Directory Contents
```bash
# Basic listing
ls

# Detailed listing with permissions
ls -l

# Include hidden files
ls -la

# Human-readable file sizes
ls -lh

# Sort by modification time
ls -lt

# Recursive listing
ls -R
```

#### `cd` - Change Directory
```bash
# Go to home directory
cd ~
cd $HOME

# Go to parent directory
cd ..

# Go to previous directory
cd -

# Go to root
cd /

# Absolute path
cd /etc/ssh

# Relative path
cd ../var/log
```

#### `pwd` - Print Working Directory
```bash
# Show current directory
pwd
```

#### `find` - Search for Files
```bash
# Find files by name
find / -name "filename.txt"

# Find files by type
find /home -type f  # files
find /home -type d  # directories

# Find files by size (larger than 100MB)
find / -size +100M

# Find files modified in last 7 days
find /var/log -mtime -7

# Find and execute command on results
find /tmp -name "*.log" -delete

# Find files with specific permissions
find /home -perm 644
```

#### `du` - Disk Usage
```bash
# Show directory size
du -sh /var/log

# Show sizes of all subdirectories
du -h /var

# Show only directories
du -h --max-depth=1 /var

# Sort by size
du -h /var | sort -h
```

#### `df` - Disk Free Space
```bash
# Show disk usage
df -h

# Show specific filesystem
df -h /var

# Show inodes
df -i
```

#### `mount` and `umount` - Mount Points
```bash
# List mounted filesystems
mount

# Mount a device
sudo mount /dev/sdb1 /mnt

# Unmount
sudo umount /mnt

# View mount points
df -h
```

---

## 2. Users, Groups, and Permissions

### Understanding Users and Groups

Linux is a multi-user system. Every process and file belongs to a user and a group. This provides security and access control.

### User Management

#### `/etc/passwd` - User Accounts
Contains user account information (passwords are in `/etc/shadow`).

**Format:** `username:x:UID:GID:comment:home:shell`

```bash
# View all users
cat /etc/passwd

# View specific user
grep username /etc/passwd

# Example entry:
# john:x:1000:1000:John Doe:/home/john:/bin/bash
```

**Fields explained:**
- `username`: Login name
- `x`: Password placeholder (actual password in `/etc/shadow`)
- `UID`: User ID (0 = root, 1000+ = regular users)
- `GID`: Primary group ID
- `comment`: Full name or description
- `home`: Home directory path
- `shell`: Default shell

#### `/etc/shadow` - Password Hashes
Contains encrypted passwords (root access required).

```bash
# View shadow file (requires sudo)
sudo cat /etc/shadow

# Format: username:encrypted_password:last_change:min:max:warn:inactive:expire:reserved
```

#### `useradd` - Create User
```bash
# Create a basic user
sudo useradd username

# Create user with home directory
sudo useradd -m username

# Create user with specific UID
sudo useradd -u 1001 username

# Create user with specific shell
sudo useradd -s /bin/bash username

# Create user with comment
sudo useradd -c "Full Name" username

# Create user with specific home directory
sudo useradd -d /custom/home username

# Create system user (no login)
sudo useradd -r -s /bin/false systemuser
```

#### `usermod` - Modify User
```bash
# Change user's home directory
sudo usermod -d /new/home username

# Change user's shell
sudo usermod -s /bin/zsh username

# Add user to additional groups
sudo usermod -aG group1,group2 username

# Lock user account
sudo usermod -L username

# Unlock user account
sudo usermod -U username
```

#### `userdel` - Delete User
```bash
# Delete user (keep home directory)
sudo userdel username

# Delete user and home directory
sudo userdel -r username
```

#### `passwd` - Password Management
```bash
# Change your own password
passwd

# Change another user's password (requires sudo)
sudo passwd username

# Lock a user's password
sudo passwd -l username

# Unlock a user's password
sudo passwd -u username
```

### Group Management

#### `/etc/group` - Group Definitions
Contains group information.

**Format:** `groupname:x:GID:members`

```bash
# View all groups
cat /etc/group

# View specific group
grep groupname /etc/group

# Example:
# developers:x:1001:user1,user2,user3
```

#### `groupadd` - Create Group
```bash
# Create a group
sudo groupadd groupname

# Create group with specific GID
sudo groupadd -g 1001 groupname

# Create system group
sudo groupadd -r systemgroup
```

#### `groupmod` - Modify Group
```bash
# Change group name
sudo groupmod -n newname oldname

# Change group GID
sudo groupmod -g 2000 groupname
```

#### `groupdel` - Delete Group
```bash
# Delete a group
sudo groupdel groupname
```

#### Primary vs Secondary Groups
- **Primary Group**: User's default group (stored in `/etc/passwd`)
- **Secondary Groups**: Additional groups user belongs to

```bash
# View user's groups
groups username

# View user's primary group
id -gn username

# View all groups (primary + secondary)
id -Gn username
```

### File Permissions

Linux uses a permission system based on three categories: User (owner), Group, and Others.

#### Permission Types
- **r (Read)**: 4 - Can read file/list directory
- **w (Write)**: 2 - Can modify file/create files in directory
- **x (Execute)**: 1 - Can execute file/enter directory

#### Permission Notation

**Symbolic Notation:**
```
rwxrwxrwx
│││││││││
││││││││└─ Others: read, write, execute
│││││││└── Others: read, write
││││││└─── Others: read
│││││└──── Group: read, write, execute
││││└───── Group: read, write
│││└────── Group: read
││└─────── User: read, write, execute
│└──────── User: read, write
└───────── User: read
```

**Octal Notation:**
- Each permission set is a number (0-7)
- 4 (read) + 2 (write) + 1 (execute) = 7 (all permissions)
- Examples:
  - `755` = rwxr-xr-x (user: all, group: read+execute, others: read+execute)
  - `644` = rw-r--r-- (user: read+write, group: read, others: read)
  - `600` = rw------- (user: read+write, group: none, others: none)
  - `777` = rwxrwxrwx (all permissions for all)

#### Viewing Permissions
```bash
# View file permissions
ls -l filename

# Example output:
# -rw-r--r-- 1 user group 1024 Jan 27 10:00 filename
# │││││││││ │ │    │     │    │         │
# │││││││││ │ │    │     │    │         └─ Filename
# │││││││││ │ │    │     │    └─────────── Date
# │││││││││ │ │    │     └─────────────── Size
# │││││││││ │ │    └───────────────────── Group
# │││││││││ │ └────────────────────────── User
# │││││││││ └──────────────────────────── Link count
# ││││││││└─────────────────────────────── Others permissions
# │││││││└──────────────────────────────── Group permissions
# ││││││└───────────────────────────────── User permissions
# │└─└─└────────────────────────────────── File type (- = file, d = directory)
```

#### `chmod` - Change Permissions

**Symbolic Method:**
```bash
# Add execute permission for user
chmod u+x filename

# Remove write permission for group
chmod g-w filename

# Set read permission for others
chmod o=r filename

# Multiple changes
chmod u+x,g-w,o=r filename

# All users: read and execute
chmod a=rx filename

# Common combinations:
chmod u=rwx,g=rx,o= filename  # 750
chmod u=rw,go=r filename       # 644
```

**Octal Method:**
```bash
# Set permissions to 755
chmod 755 filename

# Set permissions to 644
chmod 644 filename

# Set permissions to 600 (private)
chmod 600 filename

# Set permissions to 777 (all permissions - use carefully!)
chmod 777 filename

# Recursive (directory and contents)
chmod -R 755 directory/
```

#### `chown` - Change Ownership
```bash
# Change owner
sudo chown username filename

# Change owner and group
sudo chown username:group filename

# Change only group
sudo chown :group filename

# Recursive
sudo chown -R username:group directory/
```

#### `chgrp` - Change Group
```bash
# Change group
chgrp groupname filename

# Recursive
chgrp -R groupname directory/
```

### Special Permissions

Special permissions extend the standard read/write/execute permissions to provide additional functionality for executables and directories.

#### SUID (Set User ID) - What It Does and Why

**What it does:**
When SUID is set on an executable file, the program runs with the **owner's permissions** instead of the user's permissions who executed it. This allows regular users to perform tasks that normally require elevated privileges.

**Why it exists:**
Some system operations require root privileges, but we don't want to give users full root access. SUID allows specific programs to temporarily run as root (or another privileged user) to perform necessary tasks.

**How it works:**
- Normal execution: User runs program → Program runs with user's permissions
- With SUID: User runs program → Program runs with **owner's** permissions

**Real-world example: `/usr/bin/passwd`**
```bash
# Check passwd permissions
ls -l /usr/bin/passwd
# Output: -rwsr-xr-x 1 root root ... /usr/bin/passwd
# Notice the 's' instead of 'x' in the user position

# Why this is needed:
# - /etc/shadow (password file) is owned by root and only root can write to it
# - Regular users need to change their own passwords
# - Solution: passwd has SUID, so when user runs it, it runs as root
# - This allows users to modify /etc/shadow (but only through the passwd program)
```

**Setting SUID:**
```bash
# Method 1: Symbolic notation
chmod u+s filename

# Method 2: Octal notation (4 = SUID bit)
chmod 4755 filename
# Breakdown: 4 (SUID) + 755 (rwxr-xr-x)

# Verify SUID is set
ls -l filename
# You'll see 's' instead of 'x' in the user execute position: -rwsr-xr-x
```

**Common SUID programs:**
```bash
# Find all SUID programs on your system
find /usr -type f -perm -4000

# Common examples:
# /usr/bin/passwd - Change passwords
# /usr/bin/sudo - Execute commands as another user
# /usr/bin/ping - Send network packets (requires root for raw sockets)
# /usr/bin/mount - Mount filesystems
```

**Security warning:**
SUID can be dangerous if set on untrusted programs. Only set SUID on programs you trust completely, as they will run with elevated privileges.

**Practical example - Creating a SUID script (for learning):**
```bash
# Create a script that needs root privileges
cat > /tmp/backup_etc.sh << 'EOF'
#!/bin/bash
# This script backs up /etc directory
tar -czf /tmp/etc_backup_$(date +%Y%m%d).tar.gz /etc
echo "Backup created by user: $(whoami)"
EOF

chmod +x /tmp/backup_etc.sh

# Without SUID: Regular user can't access /etc properly
# With SUID: Script runs as root (owner)
sudo chown root:root /tmp/backup_etc.sh
sudo chmod 4755 /tmp/backup_etc.sh  # Set SUID

# Now any user can run it, but it executes as root
/tmp/backup_etc.sh
```

#### SGID (Set Group ID) - What It Does and Why

**What it does:**
- **On executables**: Program runs with the **group's** permissions instead of the user's group
- **On directories**: New files created in the directory automatically inherit the directory's group ownership

**Why it exists:**
- **For executables**: Similar to SUID, but uses group permissions instead of user permissions
- **For directories**: Ensures files created in a shared directory belong to the correct group, enabling collaboration

**How it works on directories:**
- Normal directory: User creates file → File belongs to user's primary group
- With SGID: User creates file → File belongs to **directory's group**

**Real-world example - Shared project directory:**
```bash
# Scenario: Team of developers working on a project
# Goal: All files should belong to 'developers' group

# Create shared directory
sudo mkdir /opt/project
sudo groupadd developers
sudo chgrp developers /opt/project
sudo chmod 2775 /opt/project  # 2 = SGID, 775 = rwxrwxr-x

# Verify SGID is set
ls -ld /opt/project
# Output: drwxrwsr-x ... /opt/project
# Notice the 's' in the group execute position

# Add users to developers group
sudo usermod -aG developers user1
sudo usermod -aG developers user2

# Now when user1 creates a file:
user1$ touch /opt/project/file1.txt
user1$ ls -l /opt/project/file1.txt
# Output: -rw-r--r-- 1 user1 developers ... file1.txt
# Notice: File belongs to 'developers' group automatically!

# Without SGID, the file would belong to user1's primary group
```

**Setting SGID:**
```bash
# Method 1: Symbolic notation
chmod g+s directory/

# Method 2: Octal notation (2 = SGID bit)
chmod 2755 directory/
# Breakdown: 2 (SGID) + 755 (rwxr-xr-x)

# Verify SGID is set
ls -ld directory/
# You'll see 's' instead of 'x' in the group execute position: drwxrwsr-x
```

**Practical example - Team collaboration:**
```bash
# Setup shared web directory for web developers
sudo groupadd webdev
sudo mkdir -p /var/www/shared
sudo chgrp webdev /var/www/shared
sudo chmod 2775 /var/www/shared  # SGID + rwxrwxr-x

# Add developers to group
sudo usermod -aG webdev developer1
sudo usermod -aG webdev developer2

# Now all files created will belong to webdev group
developer1$ echo "test" > /var/www/shared/test.html
developer2$ ls -l /var/www/shared/test.html
# File belongs to webdev group, so developer2 can edit it
```

**SGID on executables (less common):**
```bash
# Example: A program that needs to access group-specific resources
# When executed, it runs with the group's permissions
chmod g+s /usr/local/bin/group_tool
```

#### Sticky Bit
On directories, only the owner can delete files (even if others have write permission). Common on `/tmp`.

```bash
# Set sticky bit
chmod +t directory/
# or
chmod 1755 directory/

# Check /tmp permissions
ls -ld /tmp
# drwxrwxrwt - the 't' indicates sticky bit
```

### Access Control Lists (ACLs)

ACLs provide more granular permissions than standard Unix permissions.

#### Install ACL Support
```bash
# Ubuntu/Debian
sudo apt-get install acl

# RedHat/CentOS
sudo yum install acl
```

#### `getfacl` - View ACLs
```bash
# View ACLs on a file
getfacl filename

# Example output:
# # file: filename
# # owner: user
# # group: group
# user::rw-
# group::r--
# other::r--
# user:john:rwx
# group:developers:r-x
```

#### `setfacl` - Set ACLs
```bash
# Add read/write/execute for specific user
setfacl -m u:username:rwx filename

# Add read/execute for specific group
setfacl -m g:groupname:r-x filename

# Remove ACL entry
setfacl -x u:username filename

# Remove all ACLs
setfacl -b filename

# Set default ACLs (inherited by new files)
setfacl -d -m u:username:rwx directory/

# Recursive
setfacl -R -m u:username:rwx directory/
```

#### Practical ACL Example
```bash
# Create a shared directory
mkdir /shared
chmod 755 /shared

# Allow specific users full access
setfacl -m u:user1:rwx /shared
setfacl -m u:user2:rwx /shared

# Set default ACLs so new files inherit permissions
setfacl -d -m u:user1:rwx /shared
setfacl -d -m u:user2:rwx /shared

# Verify
getfacl /shared
```

---

## 2.5. Understanding sudo

### What is sudo?

**sudo** (Super User DO) allows you to run commands with elevated privileges (as root or another user) without logging in as root. This is essential for system administration tasks.

**Why use sudo instead of logging in as root?**
- **Security**: Better audit trail (logs who ran what)
- **Safety**: Prevents accidental system damage
- **Best Practice**: Standard way to manage Linux systems
- **Granular Control**: Can restrict which commands users can run

### Basic sudo Usage

#### Running Commands with sudo

```bash
# Run a single command as root
sudo command

# Example: Install a package
sudo apt install htop

# Example: Edit system configuration
sudo nano /etc/hosts

# Example: View system logs
sudo journalctl -u ssh

# Example: Restart a service
sudo systemctl restart ssh
```

#### When sudo Asks for Password

- First use: sudo prompts for your user password (not root password)
- Timeout: After 15 minutes (default), sudo asks again
- Security: Password is not displayed as you type

```bash
# First sudo command
sudo apt update
# [sudo] password for student: [type your password]

# Within 15 minutes, no password needed
sudo apt install vim
# No password prompt

# After timeout, password required again
sudo systemctl status ssh
# [sudo] password for student: [type password]
```

### Checking sudo Access

```bash
# Check if your user has sudo privileges
sudo -v
# If successful, you have sudo access

# Check sudo configuration
sudo -l
# Lists commands you're allowed to run

# Check if you're in sudo group
groups
# Look for 'sudo' in the output

# View your sudo privileges
sudo whoami
# Should output: root
```

### Common sudo Commands

#### System Administration Tasks

```bash
# Package management
sudo apt update
sudo apt install package-name
sudo apt remove package-name

# Service management
sudo systemctl start servicename
sudo systemctl stop servicename
sudo systemctl restart servicename
sudo systemctl status servicename

# User management
sudo useradd username
sudo userdel username
sudo passwd username

# File operations (system files)
sudo nano /etc/hosts
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sudo chown user:group /path/to/file

# Network configuration
sudo ip addr add 192.168.1.100/24 dev eth0
sudo systemctl restart networking

# View system logs
sudo journalctl -u servicename
sudo tail -f /var/log/syslog
```

### sudo vs su

**sudo** (Super User DO):
- Run specific command as root
- Uses your password
- Better audit trail
- Recommended approach

**su** (Switch User):
- Switch to root user (or another user)
- Uses root's password
- Full root session
- Less secure

```bash
# Using sudo (recommended)
sudo apt update
sudo systemctl restart nginx

# Using su (alternative, less secure)
su -
# Enter root password
apt update
systemctl restart nginx
exit
```

### Understanding "Permission Denied" Errors

If you see "Permission denied" errors:

```bash
# Example error
$ systemctl restart nginx
# Failed to restart nginx.service: Access denied

# Solution: Use sudo
$ sudo systemctl restart nginx
# [sudo] password for student: 
# Successfully restarted nginx.service
```

**Common scenarios requiring sudo:**
- Installing/removing packages
- Editing files in `/etc/`
- Managing services
- Creating/deleting users
- Changing file ownership
- Modifying network configuration
- Viewing system logs
- Mounting filesystems

### sudo Best Practices

1. **Use sudo for specific commands** (not full root session)
   ```bash
   # Good
   sudo apt update
   
   # Avoid (unless necessary)
   sudo su -
   ```

2. **Double-check commands before running with sudo**
   ```bash
   # Dangerous - be careful!
   sudo rm -rf /path/to/directory
   ```

3. **Don't share your sudo password**
   - Each user should have their own account
   - sudo logs who ran what command

4. **Use visudo for sudo configuration**
   ```bash
   # Always use visudo (not direct editing)
   sudo visudo
   # NOT: sudo nano /etc/sudoers
   ```

### Troubleshooting sudo

#### "User is not in the sudoers file"

If you get this error, your user doesn't have sudo privileges:

```bash
# Check if user is in sudo group
groups
# If 'sudo' is not listed, you need to be added

# As root (or another admin), add user to sudo group:
sudo usermod -aG sudo username

# User needs to log out and back in for changes to take effect
```

#### "sudo: no tty present and no askpass program specified"

This happens when running sudo in scripts without a terminal:

```bash
# Solution: Use NOPASSWD in sudoers (for scripts)
# Or run script with -t flag
sudo -S command < password_file
```

### Quick Reference

```bash
# Basic usage
sudo command

# Run command as specific user
sudo -u username command

# Run command as root (explicit)
sudo -u root command

# Check sudo access
sudo -v

# List allowed commands
sudo -l

# Edit sudoers file safely
sudo visudo

# View sudo logs
sudo grep sudo /var/log/auth.log
```

---

## 3. Process Management

### Understanding Processes

A process is a running instance of a program. Each process has:
- **PID (Process ID)**: Unique identifier
- **PPID (Parent Process ID)**: ID of process that started it
- **UID/GID**: User and group running the process
- **State**: Running, sleeping, stopped, zombie

### Process States
- **R (Running)**: Currently executing
- **S (Sleeping)**: Waiting for an event
- **D (Uninterruptible sleep)**: Waiting for I/O
- **Z (Zombie)**: Terminated but not cleaned up
- **T (Stopped)**: Stopped by signal

### Key Process Commands

#### `ps` - List Processes
```bash
# Show all processes
ps aux

# Show processes in tree format
ps auxf

# Show processes for current user
ps ux

# Show specific process
ps -p 1234

# Show processes with custom format
ps -eo pid,ppid,cmd,%mem,%cpu

# Common options:
# a = all users
# u = user-oriented format
# x = processes without controlling terminal
# f = forest (tree) format
# e = all processes
# o = custom format
```

#### `top` - Interactive Process Monitor
```bash
# Start top
top

# Inside top:
# P = sort by CPU
# M = sort by memory
# k = kill process (enter PID)
# q = quit
# h = help
```

#### `htop` - Enhanced Process Monitor
```bash
# Install htop
sudo apt-get install htop  # Ubuntu/Debian
sudo yum install htop      # RedHat/CentOS

# Run htop
htop

# More user-friendly than top with color and better interface
```

#### `kill` - Terminate Processes
```bash
# Send TERM signal (default, allows graceful shutdown)
kill 1234

# Send specific signal
kill -SIGTERM 1234
kill -SIGKILL 1234

# Using signal numbers
kill -9 1234  # SIGKILL (force kill)
kill -15 1234 # SIGTERM (graceful)

# Kill by name (using pkill)
pkill processname

# Kill all processes by name
killall processname
```

#### Process Signals
```bash
# Common signals:
# 1  SIGHUP  - Hang up (reload configuration)
# 2  SIGINT  - Interrupt (Ctrl+C)
# 9  SIGKILL - Kill (cannot be caught, force kill)
# 15 SIGTERM - Terminate (graceful shutdown)
# 18 SIGCONT - Continue if stopped
# 19 SIGSTOP - Stop (cannot be caught)

# Send HUP signal (often used to reload config)
kill -HUP 1234
# or
kill -1 1234
```

#### `jobs`, `fg`, `bg` - Job Control - What It Does and Why

**What it does:**
Job control allows you to manage multiple processes (jobs) in your terminal session. You can run processes in the background, bring them to the foreground, suspend them, and resume them.

**Why it exists:**
- Run long-running tasks without blocking your terminal
- Switch between multiple tasks
- Keep processes running while you do other work
- Manage processes without opening multiple terminal windows

**Understanding foreground vs background:**
- **Foreground process**: Runs in your terminal, you can see output, you can interact with it (Ctrl+C to stop)
- **Background process**: Runs "behind the scenes", doesn't block your terminal, you can't interact with it directly

**Basic job control commands:**

```bash
# 1. Start a process in background (the & at the end)
sleep 60 &
# Output: [1] 12345
# [1] = job number, 12345 = process ID (PID)

# 2. List all jobs in current shell
jobs
# Output:
# [1]+  Running    sleep 60 &

# 3. List jobs with PIDs
jobs -l
# Output:
# [1]+ 12345 Running    sleep 60 &

# 4. Bring background job to foreground
fg %1      # Using job number with %
fg 1       # Using job number without % (works too)
fg         # Brings the most recent job (job with +)

# 5. Send foreground process to background
# First, start a process in foreground
sleep 60
# Press Ctrl+Z to suspend it
# Output: [1]+  Stopped    sleep 60

# Now resume it in background
bg %1
# Output: [1]+ sleep 60 &

# 6. Kill a background job
kill %1    # Sends TERM signal
kill -9 %1 # Force kill
```

**Complete cycle: Background → Foreground → Background again**

Yes! You can move a job between background and foreground multiple times. Here's the complete workflow:

```bash
# Step 1: Start a process in background
sleep 60 &
# Output: [1] 12345
# Your terminal is immediately available

# Step 2: Check it's running in background
jobs
# [1]+  Running    sleep 60 &

# Step 3: Bring it to foreground (to interact with it or see output)
fg %1
# or just: fg
# Now the process is in foreground, you can see it running

# Step 4: Suspend it (while in foreground)
# Press Ctrl+Z
# Output: [1]+  Stopped    sleep 60
# The process is now suspended (stopped)

# Step 5: Put it back in background
bg %1
# or just: bg
# Output: [1]+ sleep 60 &
# The process is now running in background again

# Step 6: You can repeat this cycle as many times as needed
fg %1      # Bring to foreground again
# Press Ctrl+Z to suspend
bg %1      # Put back in background
```

**Practical example - Monitoring a long-running task:**
```bash
# Start a backup script in background
./backup.sh &
# [1] 12345

# Do other work
ls -la
vim config.txt

# Check on the backup progress - bring to foreground
fg %1
# See the output scrolling, monitor progress

# Suspend it to get terminal back
# Press Ctrl+Z
# [1]+  Stopped    ./backup.sh

# Put it back in background to continue
bg %1
# [1]+ ./backup.sh &

# Continue with other work
# Repeat fg/bg cycle as needed to check progress
```

**Complete workflow example:**
```bash
# Scenario: You want to compile a large program, but also need to use your terminal

# Step 1: Start compilation in background
make all &
# Output: [1] 12345
# Your terminal is immediately available

# Step 2: Check job status
jobs
# [1]+  Running    make all &

# Step 3: Do other work in your terminal
ls -la
cat file.txt

# Step 4: Check if compilation finished
jobs
# If still running, you'll see it
# If finished, you might see: [1]+  Done    make all

# Step 5: Bring to foreground to see output
fg %1
# Now you can see the compilation output

# Step 6: If you want to stop it
# Press Ctrl+C (if in foreground)
# Or: kill %1 (if in background)
```

**Real-world use cases:**

**Use case 1: Long-running download**
```bash
# Download large file in background
wget https://example.com/largefile.iso &
# Job number: [1] 12345

# Continue using terminal
ls
cd ~
vim file.txt

# Check download progress
jobs
fg %1  # Bring to foreground to see progress
# Press Ctrl+Z to suspend, then bg to put back in background
```

**Use case 2: Multiple tasks**
```bash
# Start multiple background jobs
python script1.py &    # [1] 11111
python script2.py &    # [2] 22222
python script3.py &    # [3] 33333

# List all jobs
jobs
# [1]   Running    python script1.py &
# [2]   Running    python script2.py &
# [3]-  Running    python script3.py &

# Bring specific job to foreground
fg %2  # Bring script2.py to foreground

# Check status of all jobs
jobs
```

**Use case 3: Suspend and resume**
```bash
# Start a process
python long_script.py

# Realize you need to do something else
# Press Ctrl+Z to suspend
# Output: [1]+  Stopped    python long_script.py

# Do other work
ls
vim config.txt

# Resume the suspended process
fg      # Resume in foreground
# or
bg      # Resume in background
```

**Important notes:**
- Jobs are tied to your terminal session - if you close the terminal, background jobs are terminated
- Use `nohup` if you want processes to survive terminal closure
- The `+` in `jobs` output indicates the most recent job
- The `-` indicates the second most recent job

#### `nohup` - Run Process That Survives Logout - What It Does and Why

**What it does:**
`nohup` (no hang up) allows a process to continue running even after you log out or close your terminal. It also redirects output so it doesn't get lost.

**Why it exists:**
- Run long-running tasks that need to continue after you disconnect
- Execute processes via SSH that must continue after you close the connection
- Ensure processes aren't killed when terminal session ends

**The problem it solves:**
```bash
# Without nohup:
python long_script.py &
# If you close terminal or logout, the process is killed
# Output is lost

# With nohup:
nohup python long_script.py &
# Process continues even after logout
# Output is saved to nohup.out
```

**How to use nohup:**

```bash
# Basic usage - output goes to nohup.out
nohup command &
# Example:
nohup python backup_script.py &

# Custom output file
nohup command > output.log 2>&1 &
# Breakdown:
# > output.log    - Redirect stdout to output.log
# 2>&1           - Redirect stderr (2) to same place as stdout (1)
# &              - Run in background

# Example:
nohup python server.py > server.log 2>&1 &

# Check if process is running (from another terminal)
ps aux | grep python
# or
pgrep -f "python server.py"
```

**Complete example - Running a web server:**
```bash
# Start web server that needs to run continuously
nohup python -m http.server 8000 > webserver.log 2>&1 &
# Output: [1] 12345

# Close terminal or logout - server keeps running!

# From another terminal, verify it's still running
ps aux | grep "http.server"
curl http://localhost:8000

# View the output
cat webserver.log
tail -f webserver.log  # Follow output in real-time

# Stop the server (find PID first)
ps aux | grep "http.server"
kill 12345
```

**nohup vs regular background job:**
```bash
# Regular background job - dies when terminal closes
python script.py &
jobs
# [1]+  Running    python script.py &
# Close terminal → Process is killed

# nohup - survives terminal closure
nohup python script.py > script.log 2>&1 &
# Close terminal → Process continues running
```

**Real-world scenarios:**

**Scenario 1: Database backup via SSH**
```bash
# SSH into server
ssh user@server

# Start backup that takes hours
nohup mysqldump -u user -p database > backup.sql 2>&1 &
# Output: [1] 12345

# Logout - backup continues
exit

# Come back later, SSH in again
ssh user@server
ps aux | grep mysqldump  # Still running!
tail -f nohup.out        # Check progress
```

**Scenario 2: Long-running data processing**
```bash
# Process large dataset
nohup python process_data.py > processing.log 2>&1 &

# Check progress periodically
tail -f processing.log

# Even if your laptop goes to sleep or you disconnect,
# the process continues on the server
```

**Scenario 3: Multiple long-running tasks**
```bash
# Start multiple processes that need to run independently
nohup task1.sh > task1.log 2>&1 &
nohup task2.sh > task2.log 2>&1 &
nohup task3.sh > task3.log 2>&1 &

# All three continue running after logout
# Each has its own log file
```

**Best practices:**
```bash
# Always redirect output explicitly
nohup command > output.log 2>&1 &

# Use descriptive log file names
nohup backup.sh > backup_$(date +%Y%m%d).log 2>&1 &

# Check process status
ps aux | grep command_name

# View output
tail -f output.log

# Stop the process
# Find PID: ps aux | grep command_name
kill PID
# or if you know the command
pkill -f "command_name"
```

**When to use each:**
- **`command &`**: Short tasks, you'll stay logged in, want to see output
- **`nohup command &`**: Long tasks, might logout, need process to continue
- **`nohup command > log 2>&1 &`**: Long tasks, want to save output, might logout

#### `nice` and `renice` - Process Priority
Process priority ranges from -20 (highest) to 19 (lowest). Default is 0.

```bash
# Start process with low priority (high nice value)
nice -n 10 command

# Start process with high priority (low nice value, requires root)
sudo nice -n -10 command

# Change priority of running process
renice 10 1234

# Change priority of all processes by user
renice 10 -u username
```

### Process Monitoring Examples

```bash
# Find processes using most CPU
ps aux --sort=-%cpu | head -10

# Find processes using most memory
ps aux --sort=-%mem | head -10

# Find processes by user
ps aux | grep username

# Find process by name
ps aux | grep nginx

# Count processes
ps aux | wc -l

# Monitor process in real-time
watch -n 1 'ps aux | grep processname'
```

---

## 4. System Services (systemd)

### Understanding systemd

systemd is the init system and service manager for most modern Linux distributions. It manages:
- System services
- System startup
- Logging
- Device management
- User sessions

### systemd Basics

#### Units
systemd uses "units" to manage resources:
- **Service units** (`.service`) - System services
- **Target units** (`.target`) - Groups of units (like runlevels)
- **Mount units** (`.mount`) - File system mounts
- **Timer units** (`.timer`) - Scheduled tasks

### Key systemctl Commands

#### Service Management
```bash
# Start a service
sudo systemctl start servicename

# Stop a service
sudo systemctl stop servicename

# Restart a service
sudo systemctl restart servicename

# Reload configuration (if supported)
sudo systemctl reload servicename

# Check service status
sudo systemctl status servicename

# Enable service to start on boot
sudo systemctl enable servicename

# Disable service from starting on boot
sudo systemctl disable servicename

# Check if service is enabled
systemctl is-enabled servicename

# Check if service is active
systemctl is-active servicename
```

#### Listing Services
```bash
# List all services
systemctl list-units --type=service

# List only active services
systemctl list-units --type=service --state=running

# List all services (including inactive)
systemctl list-units --type=service --all

# List failed services
systemctl list-units --type=service --state=failed
```

#### Service Information
```bash
# Show service details
systemctl show servicename

# Show service dependencies
systemctl list-dependencies servicename

# Show what depends on a service
systemctl list-dependencies --reverse servicename
```

### journalctl - View Logs

```bash
# View all logs
sudo journalctl

# View logs for specific service
sudo journalctl -u servicename

# Follow logs (like tail -f)
sudo journalctl -f

# Follow logs for specific service
sudo journalctl -u servicename -f

# View logs since boot
sudo journalctl -b

# View logs since specific time
sudo journalctl --since "2024-01-27 10:00:00"
sudo journalctl --since "1 hour ago"
sudo journalctl --since yesterday

# View logs until specific time
sudo journalctl --until "2024-01-27 12:00:00"

# View last N lines
sudo journalctl -n 50

# View logs with priority (error, warning, etc.)
sudo journalctl -p err

# Search logs
sudo journalctl | grep "error"

# Export logs
sudo journalctl > logs.txt
```

### systemd-analyze - Boot Analysis

```bash
# Show boot time
systemd-analyze

# Show time taken by each service
systemd-analyze blame

# Show critical chain (slowest services)
systemd-analyze critical-chain

# Show service startup graph
systemd-analyze plot > boot.svg
```

### Creating Custom Services

#### Service File Location
- `/etc/systemd/system/` - System services (highest priority)
- `/lib/systemd/system/` - Package-installed services
- `/usr/lib/systemd/system/` - Package-installed services (newer)

#### Basic Service File Structure

Create `/etc/systemd/system/myservice.service`:

```ini
[Unit]
Description=My Custom Service
After=network.target

[Service]
Type=simple
User=myuser
ExecStart=/usr/bin/mycommand
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

#### Service File Sections Explained

**`[Unit]` Section:**
- `Description`: Service description
- `After`: Start after these units
- `Before`: Start before these units
- `Requires`: Hard dependency
- `Wants`: Soft dependency

**`[Service]` Section:**
- `Type`: Service type (simple, forking, oneshot, notify)
- `User`: User to run service as
- `ExecStart`: Command to start service
- `ExecStop`: Command to stop service
- `Restart`: When to restart (always, on-failure, never)
- `RestartSec`: Seconds to wait before restarting
- `Environment`: Environment variables

**`[Install]` Section:**
- `WantedBy`: Target that should start this service

#### Example: Simple Service
```ini
[Unit]
Description=My Python Application
After=network.target

[Service]
Type=simple
User=myuser
WorkingDirectory=/opt/myapp
ExecStart=/usr/bin/python3 /opt/myapp/app.py
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```

#### Example: Service with Environment Variables
```ini
[Unit]
Description=My Application with Environment
After=network.target

[Service]
Type=simple
User=myuser
Environment="DATABASE_URL=postgresql://localhost/mydb"
Environment="API_KEY=secret123"
ExecStart=/usr/bin/myapp
Restart=always

[Install]
WantedBy=multi-user.target
```

#### Activating a Custom Service
```bash
# Create service file
sudo nano /etc/systemd/system/myservice.service

# Reload systemd to recognize new service
sudo systemctl daemon-reload

# Enable and start service
sudo systemctl enable myservice.service
sudo systemctl start myservice.service

# Check status
sudo systemctl status myservice.service
```

### systemd Targets

Targets are like runlevels in older systems. They group services together.

```bash
# List all targets
systemctl list-units --type=target

# Get default target
systemctl get-default

# Set default target
sudo systemctl set-default multi-user.target

# Change to target immediately
sudo systemctl isolate multi-user.target

# Common targets:
# multi-user.target - Multi-user mode (no GUI)
# graphical.target - Graphical mode
# rescue.target - Rescue mode
# emergency.target - Emergency mode
```

---

## Linux Fundamentals - Practical Exercises

**📝 Complete exercises in:** [exercises/01-foundations/01-linux-fundamentals/](../../../exercises/01-foundations/01-linux-fundamentals/)  
**💡 Reference examples in:** [examples/01-foundations/01-linux-fundamentals/](../../../examples/01-foundations/01-linux-fundamentals/)

### Exercise 1: File System Navigation
```bash
# 1. Explore the file system hierarchy
cd /
ls -la

# 2. Navigate to each major directory and understand its purpose
cd /bin && ls | head -10
cd /etc && ls | head -10
cd /var && ls -la
cd /proc && cat cpuinfo | head -20

# 3. Find all configuration files in /etc
find /etc -type f -name "*.conf" | head -20

# 4. Check disk usage
du -sh /var/*
df -h
```

### Exercise 2: User and Permission Management
```bash
# 1. Create a test user
sudo useradd -m -s /bin/bash testuser
sudo passwd testuser

# 2. Create a test group
sudo groupadd testgroup

# 3. Add user to group
sudo usermod -aG testgroup testuser

# 4. Create a test file and set permissions
touch testfile.txt
chmod 644 testfile.txt
ls -l testfile.txt

# 5. Practice with chmod
chmod 755 testfile.txt
chmod u+x testfile.txt
chmod g-w testfile.txt

# 6. Set up ACLs
sudo setfacl -m u:testuser:rwx testfile.txt
getfacl testfile.txt
```

### Exercise 3: Process Management
```bash
# 1. List all processes
ps aux | head -20

# 2. Find processes using most CPU
ps aux --sort=-%cpu | head -10

# 3. Monitor processes in real-time
htop

# 4. Start a process in background
sleep 100 &

# 5. Manage background jobs
jobs
fg %1
# Press Ctrl+Z to suspend
bg

# 6. Find and kill a process
ps aux | grep sleep
kill <PID>
```

### Exercise 4: systemd Services
```bash
# 1. List all services
systemctl list-units --type=service

# 2. Check status of a service
sudo systemctl status ssh

# 3. View service logs
sudo journalctl -u ssh -n 50

# 4. Create a simple custom service
sudo nano /etc/systemd/system/testservice.service
# Add service definition
sudo systemctl daemon-reload
sudo systemctl enable testservice
sudo systemctl start testservice
sudo systemctl status testservice
```

---

## Common Commands Reference

### File System
```bash
ls -la          # List with details
cd ~            # Go home
pwd             # Current directory
find / -name    # Search files
du -sh          # Directory size
df -h           # Disk space
mount           # List mounts
```

### Users and Groups
```bash
useradd -m user # Create user
usermod -aG group user  # Add to group
userdel -r user # Delete user
passwd user     # Change password
groups user     # User's groups
```

### Permissions
```bash
chmod 755 file  # Set permissions
chown user:group file  # Change ownership
chgrp group file        # Change group
getfacl file    # View ACLs
setfacl -m u:user:rwx file  # Set ACL
```

### Processes
```bash
ps aux          # List processes
top             # Monitor processes
kill PID        # Kill process
jobs            # Background jobs
nice -n 10 cmd  # Low priority
```

### systemd
```bash
systemctl start service    # Start service
systemctl stop service     # Stop service
systemctl status service   # Check status
systemctl enable service   # Enable on boot
journalctl -u service      # View logs
```

---

## Linux Fundamentals - Notes

Document your learnings, commands, and configurations here. Include:
- Useful commands and their options
- Common file locations
- Permission examples
- Service file examples
- Troubleshooting scenarios
- Personal insights and tips

---

### Shell Scripting

## Shell Scripting - Purpose

Learn to write shell scripts for automation, system administration, and cloud infrastructure management. Master Bash/Zsh scripting to automate repetitive tasks with comprehensive examples and best practices.

## Shell Scripting - Learning Objectives

By the end of this section, you should be able to:
- Write functional shell scripts with proper structure
- Use variables, conditionals, and loops effectively
- Handle errors and debug scripts
- Follow scripting best practices
- Create production-ready automation scripts

---

## 1. Shell Basics

### Choosing a Shell

#### Bash (Bourne Again Shell)
- Most common shell on Linux systems
- Default on most distributions
- Widely compatible
- Good for system administration scripts

```bash
# Check your shell
echo $SHELL

# Check Bash version
bash --version
```

#### Zsh (Z Shell)
- Enhanced features (autocompletion, themes)
- Popular for interactive use
- Mostly compatible with Bash
- Default on macOS (recent versions)

```bash
# Check if Zsh is installed
which zsh
zsh --version
```

#### Shell Compatibility
- Write scripts for `/bin/sh` for maximum compatibility
- Use `#!/bin/bash` for Bash-specific features
- Test scripts on target systems

### Script Structure

#### The Shebang
The first line tells the system which interpreter to use.

```bash
#!/bin/bash
```

**Important:** Must be the first line, no spaces before `#!`

```bash
# Correct
#!/bin/bash

# Wrong (spaces before)
   #!/bin/bash

# Wrong (not first line)
# Some comment
#!/bin/bash
```

#### Comments
```bash
# Single line comment

# Multi-line comments use multiple # lines
# This is a comment
# This is also a comment

# Inline comment
command  # This explains what the command does
```

#### Executable Permissions
```bash
# Make script executable
chmod +x script.sh

# Or specific permissions
chmod 755 script.sh

# Check permissions
ls -l script.sh
```

#### Running Scripts
```bash
# Method 1: Execute directly (requires executable permission)
./script.sh

# Method 2: Call with interpreter
bash script.sh
sh script.sh

# Method 3: Source the script (runs in current shell)
source script.sh
. script.sh  # Same as source
```

#### Complete Example Script
```bash
#!/bin/bash
# This is a comment
# Script: hello.sh
# Purpose: Display a greeting

echo "Hello, World!"
echo "Current user: $(whoami)"
echo "Current directory: $(pwd)"
```

---

## 2. Variables

### Variable Types

#### User-Defined Variables
```bash
# Assign value (no spaces around =)
NAME="John"
AGE=30

# Use variable
echo $NAME
echo ${NAME}  # Preferred for clarity

# Variables are case-sensitive
name="john"
Name="John"
NAME="JOHN"
```

#### Environment Variables
Predefined variables available to all processes.

```bash
# View all environment variables
env
printenv

# Common environment variables
echo $HOME      # Home directory
echo $USER      # Current user
echo $PATH      # Command search path
echo $PWD       # Current directory
echo $SHELL     # Current shell
echo $HOSTNAME  # Hostname

# Set environment variable for current session
export MY_VAR="value"

# Set for current command only
MY_VAR="value" command
```

#### Special Variables - What They Are and How to Use Them

Special variables are automatically set by the shell and provide information about the script, arguments, processes, and command execution. They're essential for writing interactive and robust scripts.

**Important:** These variables are read-only - you cannot assign values to them.

#### `$0` - Script Name

**What it is:**
Contains the name of the script or command being executed.

**How it works:**
- If script is run directly: `$0` contains the script path (e.g., `./script.sh` or `/path/to/script.sh`)
- If script is sourced: `$0` contains the shell name (e.g., `bash`)

**Use cases:**
- Display script name in error messages
- Show usage information
- Create log entries with script name

**Examples:**
```bash
#!/bin/bash
# script.sh

# Display script name
echo "Running script: $0"

# Use in error messages
if [ $# -eq 0 ]; then
    echo "Error: $0 requires at least one argument"
    exit 1
fi

# Extract just the filename (without path)
SCRIPT_NAME=$(basename "$0")
echo "Script name: $SCRIPT_NAME"

# Usage example
usage() {
    echo "Usage: $0 <file1> <file2> ..."
    echo "Example: $0 file1.txt file2.txt"
}
```

**Practical example:**
```bash
#!/bin/bash
# backup.sh

if [ $# -lt 1 ]; then
    echo "Error: $(basename $0) requires a source directory"
    echo "Usage: $(basename $0) <source_dir> [backup_dir]"
    exit 1
fi

echo "Backup script: $0"
echo "Backing up: $1"
```

#### `$1, $2, $3...` - Positional Parameters (Command-Line Arguments)

**What they are:**
Positional parameters contain the command-line arguments passed to the script. `$1` is the first argument, `$2` is the second, and so on.

**How they work:**
- Arguments are assigned in order: first argument → `$1`, second → `$2`, etc.
- If an argument isn't provided, the variable is empty
- Arguments beyond `$9` require `${10}`, `${11}`, etc. (use `$@` or `shift` for many arguments)

**Use cases:**
- Accept user input via command line
- Process files or directories specified by user
- Configure script behavior

**Examples:**
```bash
#!/bin/bash
# process_file.sh

# Access individual arguments
FILE=$1
OUTPUT=$2
MODE=${3:-normal}  # Third argument with default

echo "Processing file: $FILE"
echo "Output to: $OUTPUT"
echo "Mode: $MODE"

# Check if argument exists
if [ -z "$1" ]; then
    echo "Error: First argument (filename) is required"
    exit 1
fi

# Use argument
if [ -f "$1" ]; then
    echo "File $1 exists"
else
    echo "File $1 not found"
fi
```

**Practical example - File processor:**
```bash
#!/bin/bash
# convert.sh - Convert image format

SOURCE_FILE=$1
TARGET_FORMAT=$2
OUTPUT_FILE=$3

# Validate arguments
if [ -z "$SOURCE_FILE" ] || [ -z "$TARGET_FORMAT" ]; then
    echo "Usage: $0 <source_file> <target_format> [output_file]"
    exit 1
fi

# Use default output filename if not provided
if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="${SOURCE_FILE%.*}.${TARGET_FORMAT}"
fi

echo "Converting $SOURCE_FILE to $OUTPUT_FILE"
# Conversion command would go here
```

#### `$#` - Number of Arguments

**What it is:**
Contains the total number of positional parameters (arguments) passed to the script.

**How it works:**
- Counts only the arguments, not the script name
- Returns `0` if no arguments provided
- Useful for validation

**Use cases:**
- Validate minimum/maximum number of arguments
- Check if script was called with arguments
- Loop through arguments

**Examples:**
```bash
#!/bin/bash

# Check if any arguments provided
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

# Check for specific number of arguments
if [ $# -lt 2 ]; then
    echo "Error: At least 2 arguments required, got $#"
    exit 1
fi

if [ $# -gt 10 ]; then
    echo "Warning: Too many arguments ($#), only processing first 10"
fi

# Display argument count
echo "Number of arguments: $#"
echo "Arguments provided: $@"
```

**Practical example - Argument validation:**
```bash
#!/bin/bash
# calculator.sh

# Require exactly 3 arguments: operation, num1, num2
if [ $# -ne 3 ]; then
    echo "Usage: $0 <operation> <number1> <number2>"
    echo "Operations: add, subtract, multiply, divide"
    exit 1
fi

OPERATION=$1
NUM1=$2
NUM2=$3

case $OPERATION in
    add)
        echo $((NUM1 + NUM2))
        ;;
    subtract)
        echo $((NUM1 - NUM2))
        ;;
    multiply)
        echo $((NUM1 * NUM2))
        ;;
    divide)
        if [ $NUM2 -eq 0 ]; then
            echo "Error: Division by zero"
            exit 1
        fi
        echo $((NUM1 / NUM2))
        ;;
    *)
        echo "Unknown operation: $OPERATION"
        exit 1
        ;;
esac
```

#### `$@` - All Arguments as Separate Words

**What it is:**
Expands to all positional parameters (arguments), each as a separate quoted string. Preserves argument boundaries.

**How it works:**
- Each argument remains separate
- Preserves spaces within arguments
- Best for iterating over arguments
- When quoted (`"$@"`), each argument is individually quoted

**Use cases:**
- Pass all arguments to another command
- Iterate over all arguments
- Preserve argument structure

**Examples:**
```bash
#!/bin/bash

# Display all arguments separately
echo "All arguments:"
for arg in "$@"; do
    echo "  - $arg"
done

# Pass all arguments to another command
grep "pattern" "$@"

# Count arguments
echo "Total arguments: $#"
echo "Arguments: $@"
```

**Key difference - with spaces:**
```bash
#!/bin/bash
# test_args.sh

# Create test: ./test_args.sh "file one.txt" "file two.txt"

# $@ preserves each argument separately
echo "Using \$@:"
for arg in "$@"; do
    echo "  Argument: '$arg'"
done
# Output:
#   Argument: 'file one.txt'
#   Argument: 'file two.txt'

# Without quotes, spaces break arguments
echo "Using \$@ without quotes:"
for arg in $@; do
    echo "  Argument: '$arg'"
done
# Output:
#   Argument: 'file'
#   Argument: 'one.txt'
#   Argument: 'file'
#   Argument: 'two.txt'
```

**Practical example - File processor:**
```bash
#!/bin/bash
# process_files.sh - Process multiple files

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file1> <file2> ..."
    exit 1
fi

echo "Processing $# files..."

# Process each file
for file in "$@"; do
    if [ -f "$file" ]; then
        echo "Processing: $file"
        # Process file here
    else
        echo "Warning: $file not found, skipping"
    fi
done
```

#### `$*` - All Arguments as Single String

**What it is:**
Expands to all positional parameters as a single string, with arguments separated by the first character of `IFS` (Internal Field Separator, usually a space).

**How it works:**
- All arguments joined into one string
- Arguments separated by space (or `IFS`)
- When quoted (`"$*"`), becomes one string with spaces between arguments

**Use cases:**
- When you need all arguments as one string
- Less common than `$@`
- Useful for simple message passing

**Examples:**
```bash
#!/bin/bash

# $* as single string
echo "All arguments as one: $*"

# Difference between $@ and $*
ARGS_AT="$@"
ARGS_STAR="$*"

echo "Using \$@: $ARGS_AT"
echo "Using \$*: $ARGS_STAR"

# Practical: Create message with all arguments
MESSAGE="Processing: $*"
echo "$MESSAGE"
```

**Key difference - `$@` vs `$*`:**
```bash
#!/bin/bash
# compare.sh

# Test: ./compare.sh arg1 "arg 2" arg3

echo "Using \$@ (each argument separate):"
printf "  '%s'\n" "$@"
# Output:
#   'arg1'
#   'arg 2'
#   'arg3'

echo "Using \$* (all as one string):"
printf "  '%s'\n" "$*"
# Output:
#   'arg1 arg 2 arg3'

# When to use each:
# - Use "$@" when you need to preserve argument boundaries (most cases)
# - Use "$*" when you need all arguments as a single string (rare)
```

**Best practice:**
- **Always use `"$@"`** for iterating over arguments (preserves spaces and structure)
- Use `"$*"` only when you specifically need one string

#### `$?` - Exit Status of Last Command

**What it is:**
Contains the exit status (return code) of the last executed command.

**How it works:**
- `0` = Success
- Non-zero (1-255) = Error
- Each command sets this value
- Check immediately after command (it changes with each command)

**Use cases:**
- Check if command succeeded
- Error handling
- Conditional execution
- Debugging

**Examples:**
```bash
#!/bin/bash

# Check if command succeeded
ls /nonexistent
if [ $? -ne 0 ]; then
    echo "Command failed with exit code: $?"
fi

# Check immediately (before other commands)
grep "pattern" file.txt
EXIT_CODE=$?
if [ $EXIT_CODE -eq 0 ]; then
    echo "Pattern found"
else
    echo "Pattern not found (exit code: $EXIT_CODE)"
fi

# Use in conditional
if command; then
    echo "Success"
else
    echo "Failed with exit code: $?"
fi

# Chain commands based on exit status
command1 && command2  # Run command2 only if command1 succeeds
command1 || command2  # Run command2 only if command1 fails
```

**Practical example - Error handling:**
```bash
#!/bin/bash
# safe_copy.sh

SOURCE=$1
DEST=$2

# Copy file and check result
cp "$SOURCE" "$DEST"
if [ $? -eq 0 ]; then
    echo "File copied successfully"
else
    echo "Error: Copy failed (exit code: $?)"
    exit 1
fi

# Alternative: Direct check
if cp "$SOURCE" "$DEST"; then
    echo "Success"
else
    echo "Failed"
    exit 1
fi
```

**Common exit codes:**
```bash
# 0 - Success
# 1 - General error
# 2 - Misuse of shell command
# 126 - Command cannot execute
# 127 - Command not found
# 128 - Invalid argument to exit
# 130 - Script terminated by Ctrl+C (128 + 2)

# Check specific exit codes
command
case $? in
    0)
        echo "Success"
        ;;
    1)
        echo "General error"
        ;;
    2)
        echo "Command misuse"
        ;;
    *)
        echo "Unknown error: $?"
        ;;
esac
```

#### `$$` - Process ID of Current Shell/Script

**What it is:**
Contains the Process ID (PID) of the current shell or script.

**How it works:**
- Unique identifier for the running process
- Useful for creating unique temporary files
- Helps identify the process in system monitoring

**Use cases:**
- Create unique temporary files
- Process identification
- Logging with PID
- Lock files

**Examples:**
```bash
#!/bin/bash

# Display current PID
echo "Script PID: $$"

# Create unique temporary file
TEMP_FILE="/tmp/myscript_$$.tmp"
echo "Temporary file: $TEMP_FILE"
echo "data" > "$TEMP_FILE"

# Use in logging
LOG_FILE="/var/log/script_$$.log"
echo "Logging to: $LOG_FILE"

# Create lock file
LOCK_FILE="/tmp/script_$$.lock"
touch "$LOCK_FILE"
# ... do work ...
rm "$LOCK_FILE"
```

**Practical example - Unique temp files:**
```bash
#!/bin/bash
# process_data.sh

# Create unique temporary files using PID
TEMP_INPUT="/tmp/input_$$.txt"
TEMP_OUTPUT="/tmp/output_$$.txt"
TEMP_LOG="/tmp/process_$$.log"

# Cleanup function
cleanup() {
    rm -f "$TEMP_INPUT" "$TEMP_OUTPUT" "$TEMP_LOG"
    echo "Cleaned up temporary files for PID: $$"
}

# Set trap to cleanup on exit
trap cleanup EXIT

# Use temporary files
echo "Processing with PID: $$"
echo "Temp files: $TEMP_INPUT, $TEMP_OUTPUT"
```

#### `$!` - Process ID of Last Background Command

**What it is:**
Contains the Process ID (PID) of the last command executed in the background.

**How it works:**
- Only set when a command is run in background (`&`)
- Useful for managing background processes
- Check if background process is still running

**Use cases:**
- Monitor background processes
- Kill background processes
- Wait for background process completion
- Track multiple background jobs

**Examples:**
```bash
#!/bin/bash

# Start background process
sleep 60 &
BG_PID=$!

echo "Background process started with PID: $BG_PID"

# Check if process is still running
if ps -p $BG_PID > /dev/null; then
    echo "Process $BG_PID is still running"
else
    echo "Process $BG_PID has finished"
fi

# Wait for background process
wait $BG_PID
echo "Background process $BG_PID completed"

# Kill background process if needed
# kill $BG_PID
```

**Practical example - Background processing:**
```bash
#!/bin/bash
# parallel_process.sh

# Start multiple background processes
process_file() {
    local file=$1
    echo "Processing $file..."
    sleep 5  # Simulate processing
    echo "Done: $file"
}

# Start background jobs and track PIDs
PIDS=()
for file in file1.txt file2.txt file3.txt; do
    process_file "$file" &
    PIDS+=($!)  # Store PID of last background job
    echo "Started processing $file (PID: ${PIDS[-1]})"
done

# Wait for all background processes
echo "Waiting for all processes to complete..."
for pid in "${PIDS[@]}"; do
    wait $pid
    echo "Process $pid completed"
done

echo "All processing complete"
```

**Complete example using multiple special variables:**
```bash
#!/bin/bash
# complete_example.sh - Demonstrates all special variables

set -euo pipefail

# Display script information
echo "=== Script Information ==="
echo "Script name: $0"
echo "Script PID: $$"
echo "Number of arguments: $#"

# Process arguments
if [ $# -eq 0 ]; then
    echo "Error: $(basename $0) requires at least one argument"
    echo "Usage: $(basename $0) <file1> [file2] ..."
    exit 1
fi

# Display all arguments
echo ""
echo "=== Arguments ==="
echo "All arguments (\$@): $@"
echo "All arguments as string (\$*): $*"
echo ""

# Process each argument
echo "=== Processing Arguments ==="
ARG_NUM=1
for arg in "$@"; do
    echo "Argument $ARG_NUM: '$arg'"
    
    # Check if file exists
    if [ -f "$arg" ]; then
        echo "  ✓ File exists"
        # Process file (example)
        wc -l "$arg"
        PROCESS_EXIT=$?
        if [ $PROCESS_EXIT -eq 0 ]; then
            echo "  ✓ Processed successfully"
        else
            echo "  ✗ Processing failed (exit code: $PROCESS_EXIT)"
        fi
    else
        echo "  ✗ File not found"
    fi
    echo ""
    ((ARG_NUM++))
done

# Background process example
echo "=== Background Process ==="
sleep 5 &
BG_PID=$!
echo "Started background process with PID: $BG_PID"
echo "Main script PID: $$"
echo "Waiting for background process..."
wait $BG_PID
echo "Background process $BG_PID completed"

echo ""
echo "=== Script Complete ==="
echo "Final exit status will be: $?"
```

**Quick reference table:**

| Variable | What It Contains | Common Use |
|----------|------------------|------------|
| `$0` | Script/command name | Usage messages, logging |
| `$1, $2, ...` | Individual arguments | Access specific arguments |
| `$#` | Number of arguments | Validation, argument counting |
| `$@` | All arguments (separate) | Iteration, passing to commands |
| `$*` | All arguments (one string) | Simple string operations |
| `$?` | Last command exit status | Error checking, conditional execution |
| `$$` | Current process PID | Unique temp files, process identification |
| `$!` | Last background job PID | Background process management |

### Variable Operations

#### Assignment and Reading
```bash
# Basic assignment
VAR="value"

# Reading variable
echo $VAR
echo ${VAR}  # Preferred (prevents ambiguity)

# Example where braces are necessary
FILE="test"
echo "File: ${FILE}name"  # Output: File: testname
echo "File: $FILEname"     # Wrong: tries to use $FILEname
```

#### Default Values
```bash
# Use default if variable is unset or empty
${VAR:-default}     # Use default if unset or empty
${VAR-default}     # Use default only if unset
${VAR:=default}    # Assign default if unset or empty
${VAR=default}     # Assign default only if unset
${VAR:+value}      # Use value if VAR is set
${VAR+value}       # Use value if VAR is set (even if empty)
${VAR:?message}    # Error if unset or empty

# Examples
NAME=${1:-"Guest"}           # Use $1 or "Guest"
PORT=${PORT:-8080}           # Use $PORT or 8080
DEBUG=${DEBUG:-false}         # Use $DEBUG or false

# Check if variable is set
if [ -z "${VAR:-}" ]; then
    echo "VAR is not set"
fi
```

#### String Manipulation
```bash
VAR="Hello World"

# Length
echo ${#VAR}              # 11

# Substring extraction
echo ${VAR:0:5}          # Hello (start at 0, length 5)
echo ${VAR:6}            # World (from position 6 to end)

# String replacement
echo ${VAR/World/Unix}   # Hello Unix (first occurrence)
echo ${VAR//l/L}         # HeLLo WorLd (all occurrences)

# Remove prefix/suffix
FILE="backup.tar.gz"
echo ${FILE%.gz}         # backup.tar (remove .gz)
echo ${FILE%%.*}         # backup (remove longest .*)
echo ${FILE#backup}      # .tar.gz (remove backup)
echo ${FILE##*.}         # gz (remove longest prefix)

# Case conversion (Bash 4+)
echo ${VAR,,}            # hello world (lowercase)
echo ${VAR^^}            # HELLO WORLD (uppercase)
echo ${VAR^}             # Hello World (first letter uppercase)
```

#### Arrays
```bash
# Declare array
ARRAY=("item1" "item2" "item3")

# Or
ARRAY[0]="item1"
ARRAY[1]="item2"
ARRAY[2]="item3"

# Access elements
echo ${ARRAY[0]}         # item1
echo ${ARRAY[@]}         # All elements
echo ${ARRAY[*]}         # All elements as one string

# Array length
echo ${#ARRAY[@]}        # Number of elements

# Iterate over array
for item in "${ARRAY[@]}"; do
    echo $item
done

# Add to array
ARRAY+=("item4")

# Associative arrays (Bash 4+)
declare -A ASSOC_ARRAY
ASSOC_ARRAY["key1"]="value1"
ASSOC_ARRAY["key2"]="value2"
echo ${ASSOC_ARRAY["key1"]}
```

### Quoting

Understanding quoting is crucial for avoiding bugs.

#### Single Quotes (`'`)
Everything is literal, no expansion.

```bash
VAR="value"
echo '$VAR'              # Output: $VAR (not expanded)
echo 'Hello $USER'       # Output: Hello $USER
```

#### Double Quotes (`"`)
Variables and command substitution are expanded.

```bash
VAR="value"
echo "$VAR"              # Output: value (expanded)
echo "Hello $USER"       # Output: Hello john (expanded)

# Preserve spaces
echo "Hello    World"    # Output: Hello    World (spaces preserved)
```

#### No Quotes
Word splitting occurs, variables expanded.

```bash
VAR="Hello World"
echo $VAR                # Output: Hello World (but word splitting can occur)

# Problem with spaces
FILES="file1 file2 file3"
for file in $FILES; do   # Loops 3 times (good)
    echo $file
done

# But this can break:
FILES="file with spaces.txt"
for file in $FILES; do   # Loops 3 times (bad!)
    echo $file
done

# Solution: use quotes
for file in "$FILES"; do  # Loops once (correct)
    echo $file
done
```

#### Command Substitution
```bash
# Backticks (older style)
DATE=`date`
echo $DATE

# $() (preferred, more readable, supports nesting)
DATE=$(date)
echo $DATE

# Nested command substitution
echo "Today is $(date +%A), $(date +%B) $(date +%d)"

# In double quotes
echo "Current directory: $(pwd)"

# In assignments
FILES=$(ls)
COUNT=$(ls | wc -l)
```

---

## 3. Conditionals

### if/else Statements

#### Basic Syntax
```bash
if [ condition ]; then
    commands
fi

# With else
if [ condition ]; then
    commands
else
    other_commands
fi

# With elif
if [ condition1 ]; then
    commands1
elif [ condition2 ]; then
    commands2
else
    other_commands
fi
```

#### Test Commands

**`test` command:**
```bash
if test -f file.txt; then
    echo "File exists"
fi
```

**`[ ]` brackets (same as test):**
```bash
if [ -f file.txt ]; then
    echo "File exists"
fi

# Note: spaces are required around brackets
```

**`[[ ]]` double brackets (Bash extension, more features):**
```bash
if [[ -f file.txt ]]; then
    echo "File exists"
fi

# Supports pattern matching and regex
if [[ $VAR == *.txt ]]; then
    echo "Ends with .txt"
fi
```

#### File Tests
```bash
# File existence and type
[ -f file ]      # File exists and is regular file
[ -d dir ]       # Directory exists
[ -e path ]      # File/directory exists
[ -L file ]      # Symbolic link exists
[ -b file ]      # Block device
[ -c file ]      # Character device

# File permissions
[ -r file ]      # Readable
[ -w file ]      # Writable
[ -x file ]      # Executable

# File properties
[ -s file ]      # File exists and is not empty
[ -N file ]      # File modified since last read
[ -O file ]      # Owned by effective user
[ -G file ]      # Owned by effective group

# Comparison
[ file1 -nt file2 ]  # file1 newer than file2
[ file1 -ot file2 ]  # file1 older than file2
[ file1 -ef file2 ]  # Same file (hard links)

# Examples
if [ -f /etc/passwd ]; then
    echo "Password file exists"
fi

if [ -d /var/log ]; then
    echo "Log directory exists"
fi

if [ -r config.txt ] && [ -w config.txt ]; then
    echo "Config file is readable and writable"
fi
```

#### String Tests
```bash
# String comparison
[ -z "$VAR" ]        # String is empty (zero length)
[ -n "$VAR" ]        # String is not empty
[ "$VAR" = "value" ] # Strings are equal
[ "$VAR" != "value" ] # Strings are not equal
[ "$VAR" < "value" ] # String less than (ASCII)
[ "$VAR" > "value" ] # String greater than (ASCII)

# Pattern matching (with [[ ]])
[[ $VAR == pattern ]]      # Pattern match
[[ $VAR =~ regex ]]        # Regular expression match

# Examples
if [ -z "$USERNAME" ]; then
    echo "Username is not set"
fi

if [ "$USER" = "root" ]; then
    echo "Running as root"
fi

if [[ "$FILE" == *.txt ]]; then
    echo "Text file"
fi

if [[ "$EMAIL" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
    echo "Valid email"
fi
```

#### Numeric Tests
```bash
# Numeric comparison
[ $NUM -eq 10 ]  # Equal
[ $NUM -ne 10 ]  # Not equal
[ $NUM -lt 10 ]  # Less than
[ $NUM -le 10 ]  # Less than or equal
[ $NUM -gt 10 ]  # Greater than
[ $NUM -ge 10 ]  # Greater than or equal

# Examples
COUNT=5
if [ $COUNT -gt 10 ]; then
    echo "Count is greater than 10"
elif [ $COUNT -eq 5 ]; then
    echo "Count is exactly 5"
else
    echo "Count is less than 5"
fi
```

#### Logical Operators
```bash
# AND
[ condition1 ] && [ condition2 ]
[[ condition1 && condition2 ]]  # In double brackets

# OR
[ condition1 ] || [ condition2 ]
[[ condition1 || condition2 ]]  # In double brackets

# NOT
[ ! condition ]

# Examples
if [ -f file.txt ] && [ -r file.txt ]; then
    echo "File exists and is readable"
fi

if [ "$USER" = "root" ] || [ "$USER" = "admin" ]; then
    echo "Admin user"
fi

if [ ! -d /nonexistent ]; then
    echo "Directory does not exist"
fi
```

#### Case Statements
Useful for multiple conditions.

```bash
case $VARIABLE in
    pattern1)
        commands1
        ;;
    pattern2)
        commands2
        ;;
    *)
        default_commands
        ;;
esac

# Example
case $1 in
    start)
        echo "Starting service"
        ;;
    stop)
        echo "Stopping service"
        ;;
    restart)
        echo "Restarting service"
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

# Pattern matching
case $FILE in
    *.txt)
        echo "Text file"
        ;;
    *.jpg|*.png)
        echo "Image file"
        ;;
    *)
        echo "Unknown file type"
        ;;
esac
```

---

## 4. Loops

### for Loops

#### Iterating Over Lists
```bash
# Basic syntax
for item in list; do
    commands
done

# Example
for fruit in apple banana orange; do
    echo "Fruit: $fruit"
done

# Iterate over files
for file in *.txt; do
    echo "Processing: $file"
done

# Iterate over command output
for user in $(cat /etc/passwd | cut -d: -f1); do
    echo "User: $user"
done
```

#### C-Style for Loops
```bash
for ((i=1; i<=10; i++)); do
    echo "Number: $i"
done

# Countdown
for ((i=10; i>=1; i--)); do
    echo $i
done

# Step by 2
for ((i=0; i<=10; i+=2)); do
    echo $i
done
```

#### Iterating Over Arrays
```bash
ARRAY=("item1" "item2" "item3")

for item in "${ARRAY[@]}"; do
    echo $item
done

# With index
for i in "${!ARRAY[@]}"; do
    echo "Index $i: ${ARRAY[$i]}"
done
```

#### Iterating Over Arguments
```bash
for arg in "$@"; do
    echo "Argument: $arg"
done

# Or simply
for arg; do
    echo "Argument: $arg"
done
```

### while Loops

```bash
# Basic syntax
while [ condition ]; do
    commands
done

# Example: Count to 10
COUNT=1
while [ $COUNT -le 10 ]; do
    echo $COUNT
    COUNT=$((COUNT + 1))
done

# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < file.txt

# Infinite loop (with break condition)
while true; do
    echo "Running..."
    sleep 1
    # Break condition would go here
done

# Read user input
while true; do
    read -p "Enter command (quit to exit): " cmd
    if [ "$cmd" = "quit" ]; then
        break
    fi
    echo "You entered: $cmd"
done
```

### until Loops

Reverse of while - continues until condition is true.

```bash
# Basic syntax
until [ condition ]; do
    commands
done

# Example: Wait for service
until systemctl is-active myservice; do
    echo "Waiting for service..."
    sleep 1
done
echo "Service is active!"
```

### Loop Control

#### `break` - Exit Loop
```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        break  # Exit loop
    fi
    echo $i
done
# Output: 1 2 3 4

# Break from nested loop
for i in {1..3}; do
    for j in {1..3}; do
        if [ $j -eq 2 ]; then
            break 2  # Break from both loops
        fi
        echo "$i-$j"
    done
done
```

#### `continue` - Skip Iteration
```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        continue  # Skip this iteration
    fi
    echo $i
done
# Output: 1 2 3 4 6 7 8 9 10
```

---

## 5. Functions

### Function Definition

#### Basic Syntax
```bash
# Method 1: With function keyword
function my_function() {
    commands
}

# Method 2: Without function keyword (more portable)
my_function() {
    commands
}

# Example
greet() {
    echo "Hello, $1!"
}

greet "World"  # Output: Hello, World!
```

#### Function Parameters
```bash
# Functions use positional parameters ($1, $2, etc.)
add() {
    local sum=$(( $1 + $2 ))
    echo $sum
}

result=$(add 5 3)
echo "Sum: $result"  # Output: Sum: 8

# Function with multiple parameters
create_user() {
    local username=$1
    local home_dir=$2
    local shell=${3:-/bin/bash}  # Default shell
    
    echo "Creating user: $username"
    echo "Home: $home_dir"
    echo "Shell: $shell"
}

create_user "john" "/home/john"
```

#### Return Values
```bash
# Functions return exit status (0 = success, non-zero = error)
check_file() {
    if [ -f "$1" ]; then
        return 0  # Success
    else
        return 1  # Failure
    fi
}

if check_file "test.txt"; then
    echo "File exists"
else
    echo "File does not exist"
fi

# Return data via echo (capture with $())
get_hostname() {
    echo $(hostname)
}

HOST=$(get_hostname)
echo "Hostname: $HOST"
```

#### Local Variables
```bash
# Variables in functions are global by default
my_function() {
    VAR="value"  # Global variable
}

# Use local to make variable local
my_function() {
    local VAR="value"  # Local to function
    echo $VAR
}

# Example
counter() {
    local count=0
    count=$((count + 1))
    echo "Count: $count"
}

counter  # Output: Count: 1
counter  # Output: Count: 1 (not 2, because local)
```

#### Function Best Practices
```bash
# Good function example
backup_file() {
    local source_file=$1
    local backup_dir=${2:-/backup}
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_file="${backup_dir}/${source_file}.${timestamp}"
    
    if [ ! -f "$source_file" ]; then
        echo "Error: Source file not found: $source_file" >&2
        return 1
    fi
    
    if [ ! -d "$backup_dir" ]; then
        mkdir -p "$backup_dir" || {
            echo "Error: Cannot create backup directory" >&2
            return 1
        }
    fi
    
    cp "$source_file" "$backup_file" && {
        echo "Backup created: $backup_file"
        return 0
    } || {
        echo "Error: Backup failed" >&2
        return 1
    }
}

# Usage
backup_file "/etc/ssh/sshd_config" "/backup/ssh"
```

---

## 6. Error Handling

### Exit Codes

Every command returns an exit code:
- `0` = Success
- Non-zero = Error (usually 1-255)

```bash
# Check exit code
command
echo $?  # 0 if success, non-zero if error

# Use exit code in conditionals
if command; then
    echo "Success"
else
    echo "Failed"
fi
```

### Error Handling Techniques

#### `set -e` - Exit on Error
```bash
#!/bin/bash
set -e  # Exit immediately if a command exits with non-zero status

# Script will exit if any command fails
command_that_might_fail
echo "This won't run if above command fails"
```

#### `set -u` - Exit on Undefined Variable
```bash
#!/bin/bash
set -u  # Exit if undefined variable is used

# This will cause error if VAR is not set
echo $VAR
```

#### `set -o pipefail` - Catch Pipe Failures
```bash
#!/bin/bash
set -o pipefail  # Return value of pipeline is last command to exit with non-zero

# Without pipefail, this might return 0 even if grep fails
command | grep pattern

# With pipefail, it will return non-zero if grep fails
```

#### Combined Error Handling
```bash
#!/bin/bash
set -euo pipefail  # Best practice: all three together

# Or
set -e
set -u
set -o pipefail
```

#### `trap` - Error Trapping
```bash
# Trap errors
trap 'echo "Error on line $LINENO"' ERR

# Cleanup on exit
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/tempfile
}

trap cleanup EXIT

# Trap specific signals
trap 'echo "Interrupted"; exit 1' INT TERM

# Example: Always cleanup
temp_file="/tmp/myscript.$$"
trap "rm -f $temp_file" EXIT

echo "test" > $temp_file
# File will be deleted on exit (normal or error)
```

### Debugging

#### `set -x` - Debug Mode
```bash
#!/bin/bash
set -x  # Print each command before executing

VAR="test"
echo $VAR

# Output:
# + VAR=test
# + echo test
# test
```

#### Conditional Debugging
```bash
#!/bin/bash
# Enable debug if DEBUG is set
[ "${DEBUG:-}" = "1" ] && set -x

# Run with: DEBUG=1 ./script.sh
```

#### Logging
```bash
# Log function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" >> /var/log/myscript.log
}

log "Script started"
log "Processing file: $1"

# Or with different log levels
log_info() {
    echo "[INFO] $*"
}

log_error() {
    echo "[ERROR] $*" >&2
}

log_warn() {
    echo "[WARN] $*" >&2
}
```

---

## 7. Input/Output

### Reading Input

#### `read` Command
```bash
# Read single input
read -p "Enter your name: " name
echo "Hello, $name"

# Read multiple values
read -p "Enter first and last name: " first last
echo "First: $first, Last: $last"

# Read without prompt (silent)
read name

# Read password (hidden)
read -s -p "Enter password: " password
echo

# Read with timeout
read -t 5 -p "Enter value (5 sec timeout): " value

# Read into array
read -a array
echo "First element: ${array[0]}"
```

#### Command-Line Arguments
```bash
#!/bin/bash
# Access arguments
echo "Script: $0"
echo "First arg: ${1:-not provided}"
echo "Second arg: ${2:-not provided}"
echo "All args: $@"

# Shift arguments
shift  # Remove first argument, $2 becomes $1
echo "After shift, first arg: $1"

# Process all arguments
for arg in "$@"; do
    echo "Processing: $arg"
done
```

#### Reading from Files
```bash
# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < file.txt

# Read with line number
line_num=1
while IFS= read -r line; do
    echo "$line_num: $line"
    ((line_num++))
done < file.txt
```

### Output

#### `echo` vs `printf`
```bash
# echo - simple output
echo "Hello World"
echo -n "No newline"  # -n suppresses newline
echo -e "Line1\nLine2"  # -e enables escape sequences

# printf - formatted output (more control)
printf "Name: %s, Age: %d\n" "John" 30
printf "Number: %05d\n" 42  # Output: 00042
printf "Float: %.2f\n" 3.14159  # Output: 3.14
```

#### Redirecting Output
```bash
# Redirect stdout to file (overwrite)
command > file.txt

# Redirect stdout to file (append)
command >> file.txt

# Redirect stderr
command 2> error.log

# Redirect both stdout and stderr
command > output.log 2>&1
command &> output.log  # Shorthand

# Redirect stdout to file, stderr to another
command > output.log 2> error.log

# Discard output
command > /dev/null
command 2> /dev/null
command > /dev/null 2>&1  # Discard all output
```

#### Pipes
```bash
# Pipe stdout to next command
ls -l | grep ".txt"
ps aux | grep "nginx"

# Pipe to multiple commands
command | tee file.txt | grep pattern
```

#### Here Documents
```bash
# Here document
cat << EOF
This is a multi-line
text block that will be
printed to stdout
EOF

# Here document to file
cat > config.txt << EOF
server {
    listen 80;
    server_name example.com;
}
EOF

# Here document with variable expansion
NAME="John"
cat << EOF
Hello, $NAME
Today is $(date)
EOF

# Here document without expansion (literal)
cat << 'EOF'
This $VAR will not be expanded
EOF
```

---

## 8. Advanced Topics

### Regular Expressions

#### `grep` - Pattern Matching
```bash
# Basic grep
grep "pattern" file.txt

# Case insensitive
grep -i "pattern" file.txt

# Show line numbers
grep -n "pattern" file.txt

# Show only matching part
grep -o "pattern" file.txt

# Invert match
grep -v "pattern" file.txt

# Extended regex
grep -E "pattern1|pattern2" file.txt

# Count matches
grep -c "pattern" file.txt

# Recursive search
grep -r "pattern" /path/to/dir
```

#### `sed` - Stream Editor
```bash
# Substitute first occurrence per line
sed 's/old/new/' file.txt

# Substitute all occurrences
sed 's/old/new/g' file.txt

# Substitute with backup
sed -i.bak 's/old/new/g' file.txt

# Delete lines
sed '/pattern/d' file.txt

# Print specific lines
sed -n '10,20p' file.txt  # Lines 10-20

# Multiple commands
sed -e 's/old1/new1/' -e 's/old2/new2/' file.txt
```

#### `awk` - Text Processing
```bash
# Print specific field
awk '{print $1}' file.txt  # First field

# Print with delimiter
awk -F: '{print $1, $3}' /etc/passwd  # Fields 1 and 3

# Conditional printing
awk '$3 > 1000 {print $1}' /etc/passwd

# Built-in variables
awk '{print NR, NF, $0}' file.txt  # Line number, field count, whole line
```

### Process Substitution

```bash
# Input process substitution
diff <(sort file1.txt) <(sort file2.txt)

# Output process substitution
command > >(tee output.log | grep error)

# Example: Compare sorted outputs
comm <(sort file1) <(sort file2)
```

### Background Jobs

```bash
# Run command in background
command &

# Run multiple commands in background
command1 &
command2 &
command3 &
wait  # Wait for all background jobs

# Run command in background and detach
nohup command > output.log 2>&1 &

# Check background jobs
jobs

# Bring to foreground
fg %1

# Send to background
bg %1
```

---

## Complete Script Examples

**💡 See working examples in:** [examples/01-foundations/02-shell-scripting/](../../../examples/01-foundations/02-shell-scripting/)

### Example 1: System Information Script
```bash
#!/bin/bash
# system_info.sh - Display system information

set -euo pipefail

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Users logged in: $(who | wc -l)"
echo "Disk usage:"
df -h | grep -E '^/dev/'
echo "Memory usage:"
free -h
```

### Example 2: Backup Script
```bash
#!/bin/bash
# backup.sh - Backup files with timestamp

set -euo pipefail

SOURCE_DIR=${1:-$HOME}
BACKUP_DIR=${2:-/backup}
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "${BACKUP_DIR}/${BACKUP_NAME}" "$SOURCE_DIR"

echo "Backup created: ${BACKUP_DIR}/${BACKUP_NAME}"
echo "Size: $(du -h "${BACKUP_DIR}/${BACKUP_NAME}" | cut -f1)"
```

### Example 3: User Management Script
```bash
#!/bin/bash
# create_user.sh - Create user with validation

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <username> [home_directory] [shell]"
    exit 1
fi

USERNAME=$1
HOME_DIR=${2:-/home/$USERNAME}
SHELL=${3:-/bin/bash}

# Check if user exists
if id "$USERNAME" &>/dev/null; then
    echo "Error: User $USERNAME already exists"
    exit 1
fi

# Create user
sudo useradd -m -d "$HOME_DIR" -s "$SHELL" "$USERNAME"

# Set password
sudo passwd "$USERNAME"

echo "User $USERNAME created successfully"
echo "Home directory: $HOME_DIR"
echo "Shell: $SHELL"
```

### Example 4: Log Monitoring Script
```bash
#!/bin/bash
# monitor_logs.sh - Monitor log files for errors

set -euo pipefail

LOG_FILE=${1:-/var/log/syslog}
KEYWORD=${2:-error}

echo "Monitoring $LOG_FILE for '$KEYWORD'..."
echo "Press Ctrl+C to stop"
echo ""

tail -f "$LOG_FILE" | while IFS= read -r line; do
    if echo "$line" | grep -qi "$KEYWORD"; then
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] $line"
    fi
done
```

---

## Scripting Best Practices Summary

1. **Always use shebang**: `#!/bin/bash`
2. **Set error handling**: `set -euo pipefail`
3. **Use meaningful variable names**: `USER_NAME` not `X`
4. **Quote variables**: `"$VAR"` not `$VAR`
5. **Add comments**: Explain complex logic
6. **Validate input**: Check arguments and files
7. **Use functions**: Break code into reusable pieces
8. **Handle errors gracefully**: Provide meaningful messages
9. **Use local variables**: In functions, use `local`
10. **Test scripts**: Test with various inputs
11. **Follow style guide**: Consistent formatting
12. **Document usage**: Include usage examples

---

## Shell Scripting - Notes

Document your learnings here:
- Script examples you've created
- Useful snippets and patterns
- Common mistakes and solutions
- Debugging techniques
- Best practices discovered
- Troubleshooting tips

---

### System Configuration

## System Configuration - Purpose

Learn to configure Linux systems for network, packages, services, and logs. Essential skills for managing cloud infrastructure and servers.

## System Configuration - Learning Objectives

By the end of this section, you should be able to:
- Configure network interfaces
- Manage software packages
- Configure and manage system services
- Manage system logs effectively

## Topics to Cover

### 1. Network Configuration
- **Network Interfaces**
  - Interface naming (eth0, ens33, etc.)
  - `/etc/network/interfaces` (Debian/Ubuntu)
  - NetworkManager configuration
  - Netplan (Ubuntu 18.04+)
  - Static vs DHCP configuration

- **Network Commands**
  - `ip` - Modern network configuration
    - `ip addr` - Address management
    - `ip link` - Link management
    - `ip route` - Routing
  - `ifconfig` - Legacy (deprecated)
  - `netstat`, `ss` - Network connections
  - `ping`, `traceroute` - Connectivity testing

- **DNS Configuration**
  - `/etc/resolv.conf`
  - `/etc/hosts`
  - Systemd-resolved

- **Network Troubleshooting**
  - Check interface status
  - Test connectivity
  - Analyze network traffic
  - Firewall rules

### 2. Package Management
- **Package Manager Overview**
  - Different distributions use different managers
  - APT (Debian/Ubuntu)
  - YUM/DNF (RedHat/CentOS/Fedora)
  - APK (Alpine)
  - Pacman (Arch)

- **APT (Debian/Ubuntu)**
  - `apt update` - Update package lists
  - `apt upgrade` - Upgrade packages
  - `apt install` - Install packages
  - `apt remove` - Remove packages
  - `apt search` - Search packages
  - `apt list` - List packages
  - `/etc/apt/sources.list` - Repositories

- **YUM/DNF (RedHat/CentOS/Fedora)**
  - `yum install` / `dnf install`
  - `yum update` / `dnf update`
  - `yum remove` / `dnf remove`
  - `/etc/yum.repos.d/` - Repositories

- **Package Management Best Practices**
  - Keep systems updated
  - Use official repositories
  - Understand dependencies
  - Handle conflicts

### 3. Service Management
- **systemd Services** (covered in Linux Fundamentals)
  - Review: `systemctl` commands
  - Service dependencies
  - Service templates

- **Service Configuration**
  - Service unit files
  - Environment variables
  - Resource limits
  - Security contexts

- **Service Monitoring**
  - Check service status
  - Monitor service logs
  - Set up service health checks

### 4. Log Management
- **System Logs**
  - `/var/log/` directory
  - Common log files:
    - `/var/log/syslog` - System messages
    - `/var/log/auth.log` - Authentication
    - `/var/log/kern.log` - Kernel messages
    - `/var/log/apache2/` - Web server logs
    - `/var/log/nginx/` - Nginx logs

- **journalctl (systemd)**
  - `journalctl` - View logs
  - `journalctl -u service` - Service logs
  - `journalctl -f` - Follow logs
  - `journalctl --since` - Time-based filtering
  - Log rotation and retention

- **Log Rotation**
  - `logrotate` configuration
  - `/etc/logrotate.conf`
  - `/etc/logrotate.d/` - Service-specific
  - Rotation policies
  - Compression

- **Log Analysis**
  - `grep` - Search logs
  - `tail`, `head` - View log portions
  - `less`, `more` - Pager tools
  - `awk`, `sed` - Text processing
  - Log aggregation tools

- **Centralized Logging**
  - Why centralize logs
  - Log shipping concepts
  - Tools: rsyslog, syslog-ng

## Learning Resources

- Distribution-specific documentation
- Network configuration guides
- Package manager documentation
- systemd and journalctl man pages
- Log management best practices

## System Configuration - Practical Exercises

**📝 Complete exercises in:** [exercises/01-foundations/03-system-configuration/](../../../exercises/01-foundations/03-system-configuration/)  
**💡 Reference examples in:** [examples/01-foundations/03-system-configuration/](../../../examples/01-foundations/03-system-configuration/)

1. **Network Configuration**
   - Configure a static IP address
   - Set up DNS resolution
   - Test network connectivity
   - Troubleshoot network issues

2. **Package Management**
   - Install and remove packages
   - Update system packages
   - Add new repositories
   - Resolve package conflicts
   - Create a list of installed packages

3. **Service Management**
   - Configure a custom service
   - Set service dependencies
   - Configure service to start on boot
   - Monitor service health

4. **Log Management**
   - View system logs
   - Filter logs by service
   - Set up log rotation
   - Analyze log files for errors
   - Create log monitoring scripts

5. **Complete System Setup**
   - Configure a Linux server from scratch
   - Set up networking
   - Install required packages
   - Configure services
   - Set up log rotation

## Configuration Files Reference

### Network
- `/etc/network/interfaces` - Debian/Ubuntu network config
- `/etc/netplan/` - Ubuntu 18.04+ network config
- `/etc/systemd/network/` - systemd-networkd config
- `/etc/resolv.conf` - DNS configuration
- `/etc/hosts` - Local hostname resolution

### Packages
- `/etc/apt/sources.list` - APT repositories
- `/etc/yum.repos.d/` - YUM repositories
- `/etc/dnf/dnf.conf` - DNF configuration

### Services
- `/etc/systemd/system/` - System service files
- `/lib/systemd/system/` - System service files (packages)
- `/etc/default/` - Service defaults

### Logs
- `/etc/logrotate.conf` - Log rotation config
- `/etc/logrotate.d/` - Service-specific rotation
- `/etc/rsyslog.conf` - rsyslog configuration

## Detailed Examples and Commands

### Network Configuration Examples

#### View Network Interfaces
```bash
# List all network interfaces
ip addr show
# or
ip a

# Show specific interface
ip addr show eth0

# Show only interface names
ip link show

# Legacy command (deprecated but still used)
ifconfig
```

#### Configure Static IP with ip command
```bash
# Add IP address to interface
sudo ip addr add 192.168.1.100/24 dev eth0

# Bring interface up
sudo ip link set eth0 up

# Add default gateway
sudo ip route add default via 192.168.1.1

# Verify configuration
ip addr show eth0
ip route show
```

#### Configure Static IP with Netplan (Ubuntu 18.04+)
```yaml
# /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
```

Apply configuration:
```bash
sudo netplan apply
# or test first
sudo netplan try
```

#### Configure Static IP with /etc/network/interfaces (Debian/Ubuntu)
```bash
# /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8 8.8.4.4
```

Apply:
```bash
sudo ifdown eth0 && sudo ifup eth0
# or
sudo systemctl restart networking
```

#### Network Troubleshooting Commands
```bash
# Test connectivity
ping -c 4 8.8.8.8
ping -c 4 google.com

# Trace route
traceroute google.com
# or
tracepath google.com

# Check DNS resolution
nslookup google.com
dig google.com
host google.com

# Check network connections
ss -tuln  # All listening ports
netstat -tuln  # Legacy command

# Check routing table
ip route show
route -n  # Legacy

# Monitor network traffic
sudo tcpdump -i eth0
sudo tcpdump -i eth0 port 80

# Check interface statistics
ip -s link show eth0
```

### Package Management Examples

#### APT (Debian/Ubuntu) Detailed Commands
```bash
# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade

# Upgrade system (dist-upgrade)
sudo apt dist-upgrade

# Install package
sudo apt install package-name

# Install multiple packages
sudo apt install package1 package2 package3

# Remove package (keep config files)
sudo apt remove package-name

# Remove package and config files
sudo apt purge package-name

# Search for packages
apt search keyword

# Show package information
apt show package-name

# List installed packages
apt list --installed

# List upgradable packages
apt list --upgradable

# Clean package cache
sudo apt clean
sudo apt autoclean

# Remove unused packages
sudo apt autoremove

# Hold package (prevent updates)
sudo apt hold package-name
sudo apt unhold package-name

# Add repository
sudo add-apt-repository "deb http://repo.example.com/ubuntu focal main"
sudo apt update
```

#### YUM/DNF (RedHat/CentOS/Fedora) Detailed Commands
```bash
# Update all packages
sudo yum update
# or
sudo dnf update

# Install package
sudo yum install package-name
sudo dnf install package-name

# Remove package
sudo yum remove package-name
sudo dnf remove package-name

# Search packages
yum search keyword
dnf search keyword

# Show package information
yum info package-name
dnf info package-name

# List installed packages
yum list installed
dnf list installed

# Clean cache
sudo yum clean all
sudo dnf clean all

# Add repository
sudo yum-config-manager --add-repo https://repo.example.com/repo.repo
sudo dnf config-manager --add-repo https://repo.example.com/repo.repo
```

### Log Management Examples

#### journalctl Examples
```bash
# View all logs
sudo journalctl

# View logs for specific service
sudo journalctl -u nginx

# Follow logs (like tail -f)
sudo journalctl -f

# Follow logs for service
sudo journalctl -u nginx -f

# View logs since boot
sudo journalctl -b

# View logs since specific time
sudo journalctl --since "2024-01-27 10:00:00"
sudo journalctl --since "1 hour ago"
sudo journalctl --since yesterday
sudo journalctl --since "2024-01-01" --until "2024-01-31"

# View last N lines
sudo journalctl -n 50
sudo journalctl -n 100 -u nginx

# View logs with priority
sudo journalctl -p err      # Errors and above
sudo journalctl -p warning  # Warnings and above
sudo journalctl -p info     # Info and above

# View kernel logs
sudo journalctl -k

# Export logs
sudo journalctl > logs.txt
sudo journalctl -u nginx > nginx-logs.txt

# Clear old logs (keep last 3 days)
sudo journalctl --vacuum-time=3d

# Clear logs older than specific size
sudo journalctl --vacuum-size=500M
```

#### logrotate Configuration Example
```bash
# /etc/logrotate.d/myapp
/var/log/myapp/*.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 myuser mygroup
    sharedscripts
    postrotate
        systemctl reload myapp
    endscript
}
```

Test logrotate:
```bash
# Test configuration
sudo logrotate -d /etc/logrotate.conf

# Force rotation
sudo logrotate -f /etc/logrotate.d/myapp
```

#### Log Analysis Examples
```bash
# Count errors in log
grep -i error /var/log/syslog | wc -l

# Find unique errors
grep -i error /var/log/syslog | sort | uniq

# Show last 10 errors
grep -i error /var/log/syslog | tail -10

# Monitor log for errors in real-time
tail -f /var/log/syslog | grep -i error

# Extract specific fields from logs
awk '{print $1, $2, $5}' /var/log/auth.log

# Count occurrences
grep "Failed password" /var/log/auth.log | wc -l

# Show log entries between times
sed -n '/2024-01-27 10:00:00/,/2024-01-27 11:00:00/p' /var/log/syslog
```

## Troubleshooting Guide

### Network Issues
```bash
# Interface not showing
ip link show
# If interface is down:
sudo ip link set eth0 up

# Cannot reach gateway
ping 192.168.1.1
# Check routing:
ip route show

# DNS not working
nslookup google.com
# Check /etc/resolv.conf
cat /etc/resolv.conf

# Port not accessible
ss -tuln | grep 80
# Check firewall
sudo ufw status
```

### Package Issues
```bash
# Broken packages
sudo apt --fix-broken install

# Lock file issues
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock

# Repository issues
sudo apt update
# Check /etc/apt/sources.list
```

### Service Issues
```bash
# Service won't start
sudo systemctl status servicename
sudo journalctl -u servicename -n 50

# Service keeps restarting
sudo systemctl status servicename
# Check dependencies
systemctl list-dependencies servicename
```

## System Configuration - Notes

Document your learnings here:
- Configuration examples
- Network setup procedures
- Package management tips
- Service configurations
- Log analysis techniques
- Troubleshooting scenarios
- Useful commands and options

---

### Security Basics

## Security Basics - Purpose

Learn essential Linux security practices to secure servers and cloud infrastructure. Understand SSH hardening, firewall management, access control, and file security.

## Security Basics - Learning Objectives

By the end of this section, you should be able to:
- Secure SSH access
- Configure and manage firewalls
- Control user access effectively
- Manage file permissions and ACLs
- Implement basic security hardening

## Topics to Cover

### 1. SSH Configuration and Hardening
- **SSH Basics**
  - What is SSH
  - SSH client (`ssh`)
  - SSH server (sshd)
  - Key-based authentication vs passwords

- **SSH Configuration**
  - Client config: `~/.ssh/config`
  - Server config: `/etc/ssh/sshd_config`
  - Common settings:
    - Port (default 22)
    - PermitRootLogin
    - PasswordAuthentication
    - PubkeyAuthentication
    - MaxAuthTries

- **SSH Key Management**
  - Generate key pairs (`ssh-keygen`)
  - Copy public keys (`ssh-copy-id`)
  - SSH agent (`ssh-agent`, `ssh-add`)
  - Key types (RSA, ED25519)
  - Key permissions

- **SSH Hardening**
  - Disable root login
  - Disable password authentication
  - Change default port
  - Limit login attempts
  - Use strong ciphers
  - Two-factor authentication (2FA)
  - Fail2ban integration

- **SSH Best Practices**
  - Use key-based authentication
  - Disable unused features
  - Regular security updates
  - Monitor SSH access logs

### 2. Firewall Management
- **Firewall Concepts**
  - What is a firewall
  - Ingress vs egress rules
  - Default policies (ACCEPT, DROP, REJECT)
  - Stateful vs stateless

- **UFW (Uncomplicated Firewall)**
  - Ubuntu/Debian default
  - `ufw enable/disable` - Enable/disable
  - `ufw allow/deny` - Rules
  - `ufw status` - View rules
  - `ufw delete` - Remove rules
  - Application profiles
  - Rate limiting

- **firewalld**
  - RedHat/CentOS/Fedora default
  - Zones concept
  - `firewall-cmd` commands
  - Rich rules
  - Services and ports

- **iptables (Advanced)**
  - Low-level firewall
  - Tables (filter, nat, mangle)
  - Chains (INPUT, OUTPUT, FORWARD)
  - Rules and targets
  - Saving and restoring rules

- **Firewall Best Practices**
  - Default deny policy
  - Allow only necessary ports
  - Regular rule review
  - Logging suspicious activity

### 3. User Access Control
- **User Management**
  - Create users with appropriate permissions
  - Limit user capabilities
  - Account expiration
  - Password policies

- **sudo Configuration**
  - What is sudo
  - `/etc/sudoers` file
  - `visudo` - Safe editor
  - User and group privileges
  - Command restrictions
  - Password requirements
  - Logging sudo usage

- **Password Policies**
  - `/etc/login.defs` - Password defaults
  - `chage` - Password aging
  - Password complexity
  - Account lockout policies

- **User Restrictions**
  - Limit user resources
  - Restrict shell access
  - Home directory permissions
  - User groups and access

- **Audit User Activity**
  - Monitor user logins
  - Track command history
  - Review access logs
  - `last`, `lastlog` commands

### 4. File Permissions and ACLs
- **Standard Permissions** (Review)
  - Read, Write, Execute
  - User, Group, Others
  - `chmod`, `chown`, `chgrp`

- **Special Permissions**
  - SUID (Set User ID)
  - SGID (Set Group ID)
  - Sticky Bit
  - When to use each

- **Access Control Lists (ACLs)**
  - What are ACLs
  - When to use ACLs
  - `getfacl` - View ACLs
  - `setfacl` - Set ACLs
  - Default ACLs
  - ACL examples

- **File Security Best Practices**
  - Principle of least privilege
  - Regular permission audits
  - Secure sensitive files
  - `/etc/passwd`, `/etc/shadow` permissions
  - SSH key permissions

### 5. Additional Security Practices
- **System Updates**
  - Regular security updates
  - Automated updates
  - Update testing

- **Security Monitoring**
  - Review logs regularly
  - Monitor failed login attempts
  - Check for suspicious activity
  - Security audit tools

- **Minimal Installation**
  - Install only needed packages
  - Remove unused services
  - Disable unnecessary features

- **Security Tools**
  - `fail2ban` - Intrusion prevention
  - `rkhunter` - Rootkit detection
  - `lynis` - Security auditing
  - `chkrootkit` - Rootkit scanner

## Learning Resources

- SSH documentation and hardening guides
- Firewall documentation (UFW, firewalld)
- Linux security best practices
- OWASP security guidelines
- Distribution-specific security guides

## Security Basics - Practical Exercises

**📝 Complete exercises in:** [exercises/01-foundations/04-security-basics/](../../../exercises/01-foundations/04-security-basics/)  
**💡 Reference examples in:** [examples/01-foundations/04-security-basics/](../../../examples/01-foundations/04-security-basics/)

1. **SSH Hardening**
   - Generate SSH key pairs
   - Configure key-based authentication
   - Harden SSH server configuration
   - Test SSH access
   - Set up fail2ban

2. **Firewall Configuration**
   - Configure UFW or firewalld
   - Allow only necessary ports
   - Set up default deny policy
   - Test firewall rules
   - Configure logging

3. **User Access Control**
   - Create users with limited privileges
   - Configure sudo access
   - Set password policies
   - Test user restrictions
   - Audit user activity

4. **File Permissions**
   - Review and fix file permissions
   - Set up ACLs for complex scenarios
   - Secure sensitive configuration files
   - Audit system permissions

5. **Complete Security Hardening**
   - Harden a Linux server from scratch
   - Implement all security measures
   - Test security configuration
   - Document security procedures

## Security Checklist

- [ ] SSH hardened (key-based auth, no root login)
- [ ] Firewall configured (only necessary ports open)
- [ ] Users have appropriate permissions
- [ ] sudo configured properly
- [ ] Password policies enforced
- [ ] File permissions reviewed
- [ ] System updated regularly
- [ ] Unnecessary services disabled
- [ ] Logging and monitoring enabled
- [ ] Security tools installed

## Configuration Files Reference

### SSH
- `/etc/ssh/sshd_config` - SSH server config
- `~/.ssh/config` - SSH client config
- `~/.ssh/authorized_keys` - Authorized keys
- `/etc/ssh/ssh_host_*` - Host keys

### Firewall
- `/etc/ufw/` - UFW configuration
- `/etc/firewalld/` - firewalld configuration
- `/etc/iptables/` - iptables rules

### Access Control
- `/etc/sudoers` - sudo configuration
- `/etc/login.defs` - Login defaults
- `/etc/passwd` - User accounts
- `/etc/shadow` - Password hashes
- `/etc/group` - Groups

## Detailed Examples and Configurations

### SSH Configuration Examples

#### Generate SSH Key Pair
```bash
# Generate RSA key (2048 bits, older but widely supported)
ssh-keygen -t rsa -b 2048 -C "your_email@example.com"

# Generate ED25519 key (recommended, more secure)
ssh-keygen -t ed25519 -C "your_email@example.com"

# Generate with specific filename
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_server

# Generate without passphrase (not recommended for production)
ssh-keygen -t ed25519 -N ""

# View public key
cat ~/.ssh/id_ed25519.pub
```

#### Copy SSH Key to Server
```bash
# Method 1: ssh-copy-id (easiest)
ssh-copy-id user@server

# Method 2: Manual copy
cat ~/.ssh/id_ed25519.pub | ssh user@server "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

# Method 3: Manual with proper permissions
scp ~/.ssh/id_ed25519.pub user@server:~/
ssh user@server
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat ~/id_ed25519.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
rm ~/id_ed25519.pub
```

#### SSH Client Configuration (~/.ssh/config)
```bash
# ~/.ssh/config
Host myserver
    HostName 192.168.1.100
    User myuser
    Port 2222
    IdentityFile ~/.ssh/id_ed25519
    ServerAliveInterval 60
    ServerAliveCountMax 3

Host *.example.com
    User admin
    IdentityFile ~/.ssh/id_ed25519
    StrictHostKeyChecking yes

# Connect with: ssh myserver
```

#### Hardened SSH Server Configuration (/etc/ssh/sshd_config)
```bash
# /etc/ssh/sshd_config - Hardened configuration

# Change default port (optional, security through obscurity)
Port 2222

# Disable root login
PermitRootLogin no

# Disable password authentication (use keys only)
PasswordAuthentication no
PubkeyAuthentication yes

# Limit authentication attempts
MaxAuthTries 3
LoginGraceTime 60

# Disable empty passwords
PermitEmptyPasswords no

# Disable X11 forwarding (if not needed)
X11Forwarding no

# Disable port forwarding (if not needed)
AllowTcpForwarding no

# Use only strong ciphers
Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com
MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com
KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256

# Limit users who can login
AllowUsers user1 user2
# or
AllowGroups sshusers

# Deny specific users
DenyUsers baduser
DenyGroups badgroup

# Disable unused authentication methods
ChallengeResponseAuthentication no
UsePAM no

# Logging
LogLevel VERBOSE

# Restart SSH after changes
sudo systemctl restart sshd
# Test configuration first
sudo sshd -t
```

### Firewall Configuration Examples

#### UFW (Uncomplicated Firewall) Examples
```bash
# Enable UFW
sudo ufw enable

# Check status
sudo ufw status
sudo ufw status verbose
sudo ufw status numbered

# Allow specific port
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Allow port range
sudo ufw allow 8000:9000/tcp

# Allow from specific IP
sudo ufw allow from 192.168.1.100
sudo ufw allow from 192.168.1.0/24

# Allow specific port from IP
sudo ufw allow from 192.168.1.100 to any port 22

# Deny access
sudo ufw deny 23/tcp
sudo ufw deny from 192.168.1.200

# Delete rule
sudo ufw delete allow 22/tcp
# or by number
sudo ufw delete 3

# Allow application profile
sudo ufw allow 'Nginx Full'
sudo ufw app list
sudo ufw app info 'Nginx Full'

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Enable logging
sudo ufw logging on
sudo ufw logging off
sudo tail -f /var/log/ufw.log

# Rate limiting
sudo ufw limit ssh/tcp
```

#### firewalld Examples
```bash
# Check status
sudo firewall-cmd --state

# List zones
sudo firewall-cmd --get-zones
sudo firewall-cmd --get-active-zones

# List services
sudo firewall-cmd --get-services

# Add service to zone
sudo firewall-cmd --zone=public --add-service=http
sudo firewall-cmd --zone=public --add-service=https

# Add port
sudo firewall-cmd --zone=public --add-port=8080/tcp

# Remove service/port
sudo firewall-cmd --zone=public --remove-service=http
sudo firewall-cmd --zone=public --remove-port=8080/tcp

# Make changes permanent
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --reload

# Rich rules (advanced)
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.100" port port="22" protocol="tcp" accept'

# List all rules
sudo firewall-cmd --list-all
sudo firewall-cmd --list-all-zones
```

### sudo Configuration Examples

#### Basic sudo Configuration
```bash
# Edit sudoers file (always use visudo!)
sudo visudo

# Basic user privilege
username ALL=(ALL:ALL) ALL

# User can run specific commands without password
username ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart nginx

# User can run commands as specific user
username ALL=(www-data) /usr/bin/systemctl restart nginx

# Group privileges
%developers ALL=(ALL) ALL

# Command aliases
Cmnd_Alias SERVICES = /usr/bin/systemctl start, /usr/bin/systemctl stop, /usr/bin/systemctl restart
User_Alias ADMINS = user1, user2
ADMINS ALL=(ALL) SERVICES

# Environment variables
Defaults env_keep += "HOME"
username ALL=(ALL) SETENV: /usr/bin/custom_script

# Logging
Defaults logfile=/var/log/sudo.log
Defaults log_input, log_output
```

#### Example sudoers Entries
```bash
# Allow user to manage specific service
john ALL=(ALL) /usr/bin/systemctl * nginx

# Allow user to run commands as another user
admin ALL=(deploy) /usr/bin/git, /usr/bin/deploy

# Allow group to run commands without password
%wheel ALL=(ALL) NOPASSWD: ALL

# Restrict to specific directory
backup ALL=(ALL) /usr/bin/rsync, /usr/bin/tar, /bin/mkdir
```

### File Permissions and ACLs Examples

#### Secure File Permissions
```bash
# Secure SSH keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# Secure configuration files
chmod 600 /etc/ssh/sshd_config
chmod 600 /etc/shadow
chmod 644 /etc/passwd

# Secure web directory
chmod 755 /var/www
chmod 644 /var/www/html/*.html
chmod 600 /var/www/html/config.php

# Find files with wrong permissions
find /home -type f -perm -002  # World-writable files
find /home -type f ! -perm 644  # Not 644
```

#### ACL Examples for Shared Directories
```bash
# Create shared directory
sudo mkdir /shared
sudo chmod 755 /shared

# Set default ACLs (inherited by new files)
sudo setfacl -d -m u:user1:rwx /shared
sudo setfacl -d -m u:user2:rwx /shared
sudo setfacl -d -m g:developers:rwx /shared

# Set ACLs on existing directory
sudo setfacl -m u:user1:rwx /shared
sudo setfacl -m u:user2:rwx /shared

# View ACLs
getfacl /shared

# Remove ACL
sudo setfacl -x u:user1 /shared

# Remove all ACLs
sudo setfacl -b /shared
```

### Security Tools Setup

#### fail2ban Configuration
```bash
# Install fail2ban
sudo apt install fail2ban  # Ubuntu/Debian
sudo yum install fail2ban   # RedHat/CentOS

# Configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Edit /etc/fail2ban/jail.local
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3

[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
maxretry = 3

# Start and enable
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Check status
sudo fail2ban-client status
sudo fail2ban-client status sshd

# Unban IP
sudo fail2ban-client set sshd unbanip 192.168.1.100
```

#### Security Audit with lynis
```bash
# Install lynis
sudo apt install lynis  # Ubuntu/Debian
sudo yum install lynis   # RedHat/CentOS

# Run audit
sudo lynis audit system

# View report
sudo cat /var/log/lynis-report.dat
```

### Complete Security Hardening Script Example
```bash
#!/bin/bash
# security_harden.sh - Basic security hardening script

set -euo pipefail

echo "Starting security hardening..."

# 1. Update system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# 2. Configure firewall
echo "Configuring firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh/tcp
sudo ufw --force enable

# 3. Harden SSH
echo "Hardening SSH..."
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# 4. Set up automatic security updates
echo "Setting up automatic updates..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure -plow unattended-upgrades

# 5. Install fail2ban
echo "Installing fail2ban..."
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# 6. Remove unnecessary packages
echo "Removing unnecessary packages..."
sudo apt autoremove -y

echo "Security hardening complete!"
```

## Security Checklist

Use this checklist when securing a new server:

- [ ] System updated (`apt update && apt upgrade`)
- [ ] Firewall configured and enabled
- [ ] SSH hardened:
  - [ ] Root login disabled
  - [ ] Password authentication disabled
  - [ ] Key-based authentication enabled
  - [ ] Strong ciphers configured
- [ ] Unnecessary services disabled
- [ ] Users have appropriate permissions
- [ ] sudo configured properly
- [ ] Password policies enforced
- [ ] File permissions reviewed and secured
- [ ] fail2ban or similar installed
- [ ] Automatic security updates enabled
- [ ] Logging and monitoring enabled
- [ ] Regular security audits scheduled

## Troubleshooting Security Issues

### SSH Connection Issues
```bash
# Cannot connect after hardening
# Check SSH service
sudo systemctl status sshd

# Check SSH logs
sudo journalctl -u sshd -n 50

# Test SSH configuration
sudo sshd -t

# Check if port is open
sudo ss -tuln | grep 22
sudo ufw status | grep 22
```

### Firewall Blocking Legitimate Traffic
```bash
# Check firewall rules
sudo ufw status verbose

# Check firewall logs
sudo tail -f /var/log/ufw.log

# Temporarily disable to test (NOT recommended in production)
sudo ufw disable
# Test connection
# Re-enable
sudo ufw enable
```

### Permission Issues
```bash
# Cannot access file
ls -l filename
# Check user and group
id
# Check ACLs
getfacl filename

# Fix permissions
chmod 644 filename
chown user:group filename
```

## Security Basics - Notes

Document your learnings here:
- SSH configuration examples
- Firewall rule sets
- sudo configurations
- Security hardening procedures
- Troubleshooting security issues
- Security incidents and responses
- Best practices discovered

---

**Congratulations!** You've completed the System Administration fundamentals.

---

## Networking

## Networking - Purpose

Understand network protocols, configurations, and concepts essential for cloud infrastructure. This section clarifies networking fundamentals that apply across all cloud providers.

## Topics Covered

### 1. Network Models
- OSI model
- TCP/IP model
- Protocol layers and their functions

### 2. Core Protocols
- **TCP/UDP** - Transport layer protocols
- **IP** - Internet Protocol (IPv4, IPv6)
- **HTTP/HTTPS** - Application layer protocols
- **DNS** - Domain Name System
- **DHCP** - Dynamic Host Configuration Protocol

### 3. Network Concepts
- Subnetting and CIDR notation
- Routing and routing tables
- NAT (Network Address Translation)
- Load balancing concepts
- VPN concepts

### 4. Cloud Networking Basics
- VPC (Virtual Private Cloud) concepts
- Subnets, route tables, internet gateways
- Security groups and network ACLs
- Network segmentation

## Learning Resources

- Network protocol documentation
- Cloud provider networking guides
- TCP/IP reference materials

## Networking - Practical Exercises

**📝 Complete exercises in:** [exercises/01-foundations/05-networking/](../../../exercises/01-foundations/05-networking/)  
**💡 Reference examples in:** [examples/01-foundations/05-networking/](../../../examples/01-foundations/05-networking/)

1. Analyze network traffic with tcpdump/wireshark
2. Configure DNS resolution
3. Understand subnet calculations
4. Set up basic routing
5. Test network connectivity and troubleshooting

## Networking - Notes

Document your learnings here:
- Network diagrams
- Protocol explanations
- Configuration examples
- Troubleshooting scenarios
- Cloud-specific networking notes

---

## Development Basics

## Development Basics - Purpose

Learn essential development tools and practices needed for infrastructure automation and cloud-native application development.

## Topics Covered

### 1. Version Control
- **Git** fundamentals
  - Repository management
  - Branching and merging
  - Collaboration workflows
  - Best practices

### 2. Programming Language
Choose one primary language (recommendations):
- **Python** - Widely used in DevOps, automation
- **Go** - Cloud-native, container tools
- **Node.js** - Web applications, serverless

### 3. API Development
- REST API concepts
- HTTP methods and status codes
- API design principles
- Testing APIs

### 4. Testing
- Unit testing
- Integration testing
- Test-driven development (TDD) basics

## Learning Resources

- Git documentation and tutorials
- Language-specific learning resources
- API design guides

## Development Basics - Practical Exercises

**📝 Complete exercises in:** [exercises/01-foundations/06-development-basics/](../../../exercises/01-foundations/06-development-basics/)  
**💡 Reference examples in:** [examples/01-foundations/06-development-basics/](../../../examples/01-foundations/06-development-basics/)

1. Set up a Git repository
2. Create a simple application in your chosen language
3. Build a REST API
4. Write and run tests
5. Use Git for version control

## Development Basics - Notes

Document your learnings:
- Code examples
- Git workflows
- API design patterns
- Testing strategies
- Useful libraries and tools

---