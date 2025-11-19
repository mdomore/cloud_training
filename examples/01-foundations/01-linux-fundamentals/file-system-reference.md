# Linux File System Hierarchy Reference

Quick reference for the Linux file system structure.

## Standard Directories

| Directory | Purpose | Writable by Users? |
|-----------|---------|-------------------|
| `/` | Root directory | No |
| `/bin` | Essential user binaries | No |
| `/sbin` | Essential system binaries | No |
| `/etc` | Configuration files | No (root only) |
| `/home` | User home directories | Users can write in their own |
| `/var` | Variable data (logs, cache) | Depends on subdirectory |
| `/tmp` | Temporary files | Yes (cleared on reboot) |
| `/usr` | User programs and data | No |
| `/opt` | Optional/third-party software | Depends on installation |
| `/proc` | Process information (virtual) | No |
| `/sys` | System information (virtual) | No |
| `/dev` | Device files | No |
| `/mnt` | Mount point for temporary filesystems | Root only |
| `/media` | Mount point for removable media | Root only |
| `/root` | Root user's home directory | Root only |
| `/boot` | Boot loader files | Root only |
| `/lib` | Shared libraries | No |
| `/run` | Runtime data | Depends on service |

## Important Files

### System Configuration
- `/etc/passwd` - User accounts
- `/etc/shadow` - Encrypted passwords
- `/etc/group` - Group definitions
- `/etc/hosts` - Hostname resolution
- `/etc/fstab` - File system table
- `/etc/resolv.conf` - DNS configuration

### Network
- `/etc/network/interfaces` - Network config (Debian/Ubuntu)
- `/etc/netplan/` - Network config (Ubuntu 18.04+)
- `/etc/systemd/network/` - Network config (systemd)

### Services
- `/etc/systemd/system/` - System service files
- `/lib/systemd/system/` - Package-installed services
- `/etc/ssh/sshd_config` - SSH server config

### Logs
- `/var/log/syslog` - System log (Debian/Ubuntu)
- `/var/log/messages` - System log (RedHat/CentOS)
- `/var/log/auth.log` - Authentication log
- `/var/log/kern.log` - Kernel messages

## Common Commands by Directory

### `/bin` and `/usr/bin`
```bash
ls, cp, mv, rm, mkdir, rmdir
cat, less, more, head, tail
grep, find, locate
tar, gzip, zip
```

### `/sbin` and `/usr/sbin`
```bash
ifconfig, ip, route
useradd, userdel, usermod
groupadd, groupdel
systemctl, journalctl
```

### `/etc`
```bash
# Most files are configuration, not executables
# Edit with: nano, vim, or your preferred editor
```

## Navigation Tips

```bash
# Go to home directory
cd ~
cd $HOME

# Go to previous directory
cd -

# Go to parent directory
cd ..

# Go to root
cd /
```

## Finding Files

```bash
# Find by name
find / -name "filename" 2>/dev/null

# Find by type
find /home -type f  # files
find /home -type d  # directories

# Find by size
find / -size +100M 2>/dev/null

# Find by permissions
find /usr -type f -perm -4000  # SUID files
```

## Disk Usage

```bash
# Check directory size
du -sh /var/log

# Check filesystem usage
df -h

# Find large files
find / -type f -size +100M -exec ls -lh {} \; 2>/dev/null
```

