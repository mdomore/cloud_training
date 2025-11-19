# User Management Examples

Practical examples for managing users and groups.

## Creating Users

### Basic User
```bash
# Create user with home directory and default shell
sudo useradd -m -s /bin/bash username

# Set password
sudo passwd username
```

### User with Specific UID
```bash
# Create user with specific UID
sudo useradd -m -u 1001 -s /bin/bash username
```

### System User (No Login)
```bash
# Create system user for services
sudo useradd -r -s /bin/false serviceuser
```

### User with Custom Home Directory
```bash
# Create user with custom home directory
sudo useradd -m -d /custom/home/username -s /bin/bash username
```

## Group Management

### Create Group
```bash
# Basic group
sudo groupadd groupname

# Group with specific GID
sudo groupadd -g 1001 groupname

# System group
sudo groupadd -r systemgroup
```

### Add User to Group
```bash
# Add to secondary group (preserves existing groups)
sudo usermod -aG groupname username

# Add to multiple groups
sudo usermod -aG group1,group2,group3 username
```

### Change Primary Group
```bash
# Change user's primary group
sudo usermod -g newprimarygroup username
```

## User Modifications

### Change Home Directory
```bash
# Change home directory
sudo usermod -d /new/home username

# Move home directory contents
sudo usermod -d /new/home -m username
```

### Change Shell
```bash
# Change user's default shell
sudo usermod -s /bin/zsh username
```

### Lock/Unlock Account
```bash
# Lock account
sudo usermod -L username
# or
sudo passwd -l username

# Unlock account
sudo usermod -U username
# or
sudo passwd -u username
```

### Set Account Expiration
```bash
# Set expiration date
sudo usermod -e 2024-12-31 username

# Remove expiration
sudo usermod -e "" username
```

## Complete User Setup Example

```bash
# Create development team setup
sudo groupadd developers
sudo groupadd designers

# Create users
sudo useradd -m -s /bin/bash -G developers dev1
sudo useradd -m -s /bin/bash -G developers dev2
sudo useradd -m -s /bin/bash -G designers designer1

# Set passwords
echo "dev1:password123" | sudo chpasswd
echo "dev2:password123" | sudo chpasswd
echo "designer1:password123" | sudo chpasswd

# Create shared directory
sudo mkdir -p /opt/team
sudo chgrp developers /opt/team
sudo chmod 2775 /opt/team  # SGID for group inheritance

# Verify
id dev1
groups dev1
ls -ld /opt/team
```

## Viewing User Information

```bash
# Current user info
id
whoami
groups

# Specific user info
id username
groups username

# User's primary group
id -gn username

# All groups (primary + secondary)
id -Gn username

# User's UID
id -u username

# User's GID
id -g username
```

## Password Management

```bash
# Change your own password
passwd

# Change another user's password
sudo passwd username

# Lock password
sudo passwd -l username

# Unlock password
sudo passwd -u username

# Remove password (not recommended)
sudo passwd -d username

# Force password change on next login
sudo passwd -e username
```

## User Deletion

```bash
# Delete user (keep home directory)
sudo userdel username

# Delete user and home directory
sudo userdel -r username

# Delete user, home directory, and mail spool
sudo userdel -r -f username
```

## Group Deletion

```bash
# Delete group
sudo groupdel groupname

# Note: Cannot delete if it's a user's primary group
```

## Common Patterns

### Service Account Setup
```bash
# Create service user
sudo useradd -r -s /bin/false -d /var/lib/serviceapp serviceapp
sudo mkdir -p /var/lib/serviceapp
sudo chown serviceapp:serviceapp /var/lib/serviceapp
sudo chmod 755 /var/lib/serviceapp
```

### Shared Project Directory
```bash
# Setup shared directory for team
sudo groupadd projectteam
sudo mkdir -p /opt/project
sudo chgrp projectteam /opt/project
sudo chmod 2775 /opt/project  # SGID

# Add team members
sudo usermod -aG projectteam user1
sudo usermod -aG projectteam user2
```

### Temporary Access
```bash
# Create temporary user with expiration
sudo useradd -m -s /bin/bash -e 2024-12-31 tempuser
sudo passwd tempuser

# After expiration, user cannot login but account remains
```

## Security Best Practices

### Check for Users Without Passwords
```bash
sudo awk -F: '($2 == "") {print $1}' /etc/shadow
```

### Check for Users with UID 0 (Root)
```bash
awk -F: '($3 == 0) {print $1}' /etc/passwd
```

### List Users with Shell Access
```bash
grep -E '/bin/(bash|sh|zsh)' /etc/passwd | cut -d: -f1
```

### Audit User Activity
```bash
# Last login
last username

# Failed login attempts
sudo grep "Failed password" /var/log/auth.log | grep username
```

