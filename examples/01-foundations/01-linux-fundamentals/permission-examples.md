# Permission Examples

Common file and directory permission scenarios with solutions.

## Standard Permission Patterns

### Web Server Files
```bash
# Web root directory
chmod 755 /var/www/html
chown www-data:www-data /var/www/html

# Web files (HTML, CSS, JS)
chmod 644 /var/www/html/*
chown www-data:www-data /var/www/html/*

# Executable scripts (CGI, PHP)
chmod 755 /var/www/html/cgi-bin/script.cgi
chown www-data:www-data /var/www/html/cgi-bin/script.cgi
```

### Configuration Files
```bash
# Sensitive config files (read-only for owner)
chmod 600 /etc/secret.conf
chown root:root /etc/secret.conf

# Public config files
chmod 644 /etc/app.conf
chown root:root /etc/app.conf
```

### Scripts
```bash
# User scripts
chmod 755 ~/scripts/myscript.sh
chown $USER:$USER ~/scripts/myscript.sh

# System scripts (root only)
chmod 700 /usr/local/bin/system-script.sh
chown root:root /usr/local/bin/system-script.sh
```

### Shared Directories
```bash
# Team project directory
chmod 2775 /opt/project  # SGID + rwxrwxr-x
chown devuser:developers /opt/project

# Temporary shared directory (sticky bit)
chmod 1777 /tmp/shared
```

## Special Permission Examples

### SUID Example
```bash
# Script that needs root privileges
cat > /tmp/backup_etc.sh << 'EOF'
#!/bin/bash
tar -czf /tmp/etc_backup_$(date +%Y%m%d).tar.gz /etc
EOF

chmod +x /tmp/backup_etc.sh
sudo chown root:root /tmp/backup_etc.sh
sudo chmod 4755 /tmp/backup_etc.sh  # SUID set

# Verify
ls -l /tmp/backup_etc.sh
# Output: -rwsr-xr-x (notice 's' in user position)
```

### SGID Example
```bash
# Shared directory where new files inherit group
sudo mkdir /opt/shared
sudo groupadd developers
sudo chgrp developers /opt/shared
sudo chmod 2775 /opt/shared  # SGID + rwxrwxr-x

# Verify
ls -ld /opt/shared
# Output: drwxrwsr-x (notice 's' in group position)

# Test: Create file as user, it will belong to developers group
touch /opt/shared/test.txt
ls -l /opt/shared/test.txt
# File belongs to developers group automatically
```

### Sticky Bit Example
```bash
# Directory where only owner can delete files
chmod 1777 /tmp/shared

# Verify
ls -ld /tmp/shared
# Output: drwxrwxrwt (notice 't' in others position)
```

## ACL Examples

### User-Specific Access
```bash
# Allow specific user full access
setfacl -m u:john:rwx /shared/file.txt

# View ACL
getfacl /shared/file.txt
```

### Group Access
```bash
# Allow group read/execute
setfacl -m g:developers:r-x /shared/script.sh
```

### Default ACLs (Inheritance)
```bash
# Set default ACL so new files inherit permissions
setfacl -d -m u:john:rwx /shared/directory
setfacl -d -m g:developers:r-x /shared/directory

# New files will inherit these permissions
```

### Remove ACLs
```bash
# Remove specific ACL entry
setfacl -x u:john /shared/file.txt

# Remove all ACLs
setfacl -b /shared/file.txt
```

## Common Permission Fixes

### Fix World-Writable Files
```bash
# Find and fix
find /home -type f -perm -002 -exec chmod o-w {} \;
```

### Secure SSH Keys
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/authorized_keys
```

### Secure Configuration Files
```bash
# Sensitive files should be 600 (owner read/write only)
chmod 600 ~/.bash_history
chmod 600 ~/.mysql_history
chmod 600 /etc/shadow
```

## Permission Reference

### Octal Notation
- `400` = r-------- (owner read only)
- `600` = rw------- (owner read/write)
- `644` = rw-r--r-- (owner read/write, others read)
- `755` = rwxr-xr-x (owner all, others read/execute)
- `777` = rwxrwxrwx (all permissions - avoid!)

### Symbolic Notation
- `u+x` = Add execute for user
- `g-w` = Remove write for group
- `o=r` = Set read-only for others
- `a=rx` = Set read/execute for all

### Special Permissions (Octal)
- `4755` = SUID + 755
- `2755` = SGID + 755
- `1755` = Sticky bit + 755
- `6755` = SUID + SGID + 755

