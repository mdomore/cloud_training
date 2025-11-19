# System Configuration

## Purpose

Learn to configure Linux systems for network, packages, services, and logs. Essential skills for managing cloud infrastructure and servers.

## Learning Objectives

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

## Practical Exercises

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

## Notes

Document your learnings here:
- Configuration examples
- Network setup procedures
- Package management tips
- Service configurations
- Log analysis techniques
- Troubleshooting scenarios
- Useful commands and options

---

**Next Topic:** [Security Basics](../04-security-basics/)

