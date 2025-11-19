# Common Linux Commands Reference

Quick reference for frequently used Linux commands.

## File Operations

```bash
# List files
ls -la                    # Detailed listing
ls -lh                    # Human-readable sizes
ls -lt                    # Sort by time
ls -lR                    # Recursive

# Copy files
cp file1 file2            # Copy file
cp -r dir1 dir2           # Copy directory
cp -p file1 file2         # Preserve attributes

# Move/Rename
mv file1 file2            # Move or rename
mv dir1 dir2              # Move directory

# Remove
rm file                   # Remove file
rm -r dir                 # Remove directory
rm -f file                # Force remove
rm -rf dir                # Force remove directory (careful!)

# Create
touch file                # Create empty file
mkdir dir                 # Create directory
mkdir -p path/to/dir     # Create with parents
```

## File Viewing

```bash
# View file
cat file                  # Display entire file
less file                 # Page through file
more file                 # Page through file
head -n 20 file           # First 20 lines
tail -n 20 file           # Last 20 lines
tail -f file              # Follow file (live)

# Search in file
grep pattern file         # Search for pattern
grep -r pattern dir       # Recursive search
grep -i pattern file      # Case-insensitive
```

## Permissions

```bash
# Change permissions
chmod 755 file            # Octal notation
chmod u+x file            # Symbolic notation
chmod -R 755 dir          # Recursive

# Change ownership
chown user:group file      # Change owner and group
chown -R user:group dir   # Recursive
chgrp group file           # Change group only

# View permissions
ls -l file                # Detailed listing
stat file                 # File statistics
```

## Process Management

```bash
# List processes
ps aux                    # All processes
ps aux | grep process     # Filter by name
ps -ef                    # Alternative format

# Monitor processes
top                       # Interactive monitor
htop                      # Enhanced monitor
watch -n 1 'ps aux'       # Refresh every second

# Kill processes
kill PID                  # Send TERM signal
kill -9 PID               # Force kill
killall processname       # Kill by name
pkill processname         # Kill by name pattern
```

## System Information

```bash
# System info
uname -a                  # System information
hostname                  # Hostname
uptime                    # Uptime and load
whoami                    # Current user
id                        # User and group IDs

# Disk usage
df -h                     # Filesystem usage
du -sh dir                # Directory size
du -h dir | sort -h        # Sorted by size

# Memory
free -h                   # Memory usage
cat /proc/meminfo         # Detailed memory info

# CPU
lscpu                     # CPU information
cat /proc/cpuinfo         # Detailed CPU info
```

## Network

```bash
# Network interfaces
ip addr show              # Show IP addresses
ip link show              # Show interfaces
ifconfig                  # Legacy interface config

# Connectivity
ping host                 # Ping test
ping -c 4 host            # Ping 4 times
traceroute host           # Trace route
curl url                  # HTTP request

# Network connections
ss -tuln                  # Show connections
netstat -tuln             # Legacy command
ss -tulnp                 # With process info
```

## Text Processing

```bash
# Search and replace
sed 's/old/new/g' file    # Replace in file
sed -i 's/old/new/g' file # In-place edit

# Extract columns
cut -d: -f1 file          # Extract first field
awk '{print $1}' file     # Print first column

# Sort and unique
sort file                 # Sort lines
sort -u file              # Sort and remove duplicates
uniq file                 # Remove consecutive duplicates

# Count
wc -l file                # Count lines
wc -w file                # Count words
wc -c file                # Count characters
```

## Archives

```bash
# Create archive
tar -czf archive.tar.gz dir    # Compress with gzip
tar -cjf archive.tar.bz2 dir   # Compress with bzip2
tar -czf archive.tar.gz file1 file2  # Multiple files

# Extract archive
tar -xzf archive.tar.gz         # Extract gzip
tar -xjf archive.tar.bz2        # Extract bzip2
tar -xzf archive.tar.gz -C dir  # Extract to directory

# List archive
tar -tzf archive.tar.gz          # List contents
```

## System Services

```bash
# Service management
sudo systemctl start service     # Start service
sudo systemctl stop service      # Stop service
sudo systemctl restart service   # Restart service
sudo systemctl reload service    # Reload config
sudo systemctl status service    # Check status
sudo systemctl enable service    # Enable on boot
sudo systemctl disable service   # Disable on boot

# View logs
sudo journalctl -u service        # Service logs
sudo journalctl -f               # Follow logs
sudo journalctl --since today    # Since today
```

## Users and Groups

```bash
# User info
id                            # Current user
whoami                        # Username
groups                        # User's groups

# User management (requires sudo)
sudo useradd -m username      # Create user
sudo userdel -r username      # Delete user
sudo usermod -aG group user   # Add to group
sudo passwd username          # Change password

# Group management
sudo groupadd groupname       # Create group
sudo groupdel groupname       # Delete group
```

## Package Management

### Debian/Ubuntu (APT)
```bash
sudo apt update               # Update package lists
sudo apt upgrade              # Upgrade packages
sudo apt install package      # Install package
sudo apt remove package       # Remove package
sudo apt search keyword       # Search packages
```

### RedHat/CentOS (YUM/DNF)
```bash
sudo yum update               # Update packages
sudo yum install package      # Install package
sudo yum remove package       # Remove package
sudo yum search keyword       # Search packages
```

## Useful Shortcuts

```bash
# Command history
history                      # View history
!!                           # Repeat last command
!n                           # Execute command number n
!string                      # Execute last command starting with string

# Navigation
cd -                         # Previous directory
cd ~                         # Home directory
cd ..                        # Parent directory

# Redirection
command > file               # Redirect output
command >> file              # Append output
command 2> file              # Redirect errors
command > file 2>&1           # Redirect both
command < file               # Redirect input
```

## Tips

- Use `man command` for manual pages
- Use `command --help` for quick help
- Use `which command` to find command location
- Use `type command` to see command type
- Use `history | grep pattern` to search history

