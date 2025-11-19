# Linux Fundamentals

## Purpose

Learn the essential Linux concepts and commands needed for system administration and cloud infrastructure management. This section provides comprehensive coverage of Linux fundamentals with detailed explanations and practical examples.

## Learning Objectives

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

## Practical Exercises

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

## Notes

Document your learnings, commands, and configurations here. Include:
- Useful commands and their options
- Common file locations
- Permission examples
- Service file examples
- Troubleshooting scenarios
- Personal insights and tips

---

**Next Topic:** [Shell Scripting](../02-shell-scripting/)
