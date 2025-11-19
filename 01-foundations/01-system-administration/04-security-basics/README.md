# Security Basics

## Purpose

Learn essential Linux security practices to secure servers and cloud infrastructure. Understand SSH hardening, firewall management, access control, and file security.

## Learning Objectives

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

## Practical Exercises

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

## Notes

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
**Next Section:** [Networking](../../02-networking/)

