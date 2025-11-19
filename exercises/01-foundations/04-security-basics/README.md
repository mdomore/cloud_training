# Security Basics - Exercises

## Exercise 1: SSH Configuration and Hardening

**Objective:** Secure SSH access.

### Tasks:

1. **Generate SSH key pair**
   ```bash
   # Generate ED25519 key (recommended)
   ssh-keygen -t ed25519 -C "your_email@example.com"
   
   # Or generate RSA key (if ED25519 not supported)
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   
   # View public key
   cat ~/.ssh/id_ed25519.pub
   ```

2. **Copy SSH key to server**
   ```bash
   # Using ssh-copy-id
   ssh-copy-id user@server
   
   # Or manually
   cat ~/.ssh/id_ed25519.pub | ssh user@server "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
   ```

3. **Configure SSH client**
   ```bash
   # Edit ~/.ssh/config
   nano ~/.ssh/config
   ```
   
   Add:
   ```
   Host myserver
       HostName server.example.com
       User myuser
       Port 2222
       IdentityFile ~/.ssh/id_ed25519
       ServerAliveInterval 60
   ```

4. **Harden SSH server** (requires sudo)
   ```bash
   # Backup original config
   sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
   
   # Edit SSH server config
   sudo nano /etc/ssh/sshd_config
   ```
   
   Recommended settings:
   ```
   Port 2222
   PermitRootLogin no
   PasswordAuthentication no
   PubkeyAuthentication yes
   MaxAuthTries 3
   ClientAliveInterval 300
   ClientAliveCountMax 2
   ```
   
   ```bash
   # Test configuration
   sudo sshd -t
   
   # Reload SSH service
   sudo systemctl reload sshd
   ```

### Questions to Answer:

- Why disable password authentication?
- What's the benefit of changing the default port?

---

## Exercise 2: Firewall Configuration

**Objective:** Configure firewall rules.

### Tasks:

1. **Configure UFW** (Ubuntu/Debian)
   ```bash
   # Check status
   sudo ufw status
   
   # Enable firewall
   sudo ufw enable
   
   # Allow SSH (important - do this first!)
   sudo ufw allow 22/tcp
   # or
   sudo ufw allow ssh
   
   # Allow HTTP and HTTPS
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   
   # Allow from specific IP
   sudo ufw allow from 192.168.1.100
   
   # Deny specific port
   sudo ufw deny 3306/tcp
   
   # View rules
   sudo ufw status verbose
   sudo ufw status numbered
   
   # Delete rule
   sudo ufw delete 3
   ```

2. **Configure firewalld** (RedHat/CentOS)
   ```bash
   # Check status
   sudo firewall-cmd --state
   
   # Start and enable
   sudo systemctl start firewalld
   sudo systemctl enable firewalld
   
   # Add service
   sudo firewall-cmd --permanent --add-service=ssh
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --permanent --add-service=https
   
   # Add port
   sudo firewall-cmd --permanent --add-port=8080/tcp
   
   # Reload
   sudo firewall-cmd --reload
   
   # List rules
   sudo firewall-cmd --list-all
   ```

3. **Test firewall**
   ```bash
   # From another machine, test blocked port
   telnet server_ip 3306
   
   # Test allowed port
   telnet server_ip 80
   ```

### Questions to Answer:

- What's the default policy of UFW?
- How do you allow a port range?

---

## Exercise 3: User Access Control

**Objective:** Control user access and privileges.

### Tasks:

1. **Configure sudo**
   ```bash
   # Edit sudoers file (use visudo!)
   sudo visudo
   ```
   
   Add user-specific rules:
   ```
   # Allow user to run specific commands
   username ALL=(ALL) /usr/bin/systemctl restart nginx, /usr/bin/systemctl stop nginx
   
   # Allow user to run commands without password
   username ALL=(ALL) NOPASSWD: /usr/bin/apt update
   
   # Allow group to run all commands
   %developers ALL=(ALL) ALL
   ```

2. **Set password policies**
   ```bash
   # Edit password policies
   sudo nano /etc/login.defs
   ```
   
   Configure:
   ```
   PASS_MAX_DAYS 90
   PASS_MIN_DAYS 7
   PASS_MIN_LEN 12
   PASS_WARN_AGE 14
   ```

3. **Lock and unlock accounts**
   ```bash
   # Lock account
   sudo usermod -L username
   sudo passwd -l username
   
   # Unlock account
   sudo usermod -U username
   sudo passwd -u username
   
   # Expire account
   sudo usermod -e 2024-12-31 username
   ```

4. **Audit user activity**
   ```bash
   # View sudo logs
   sudo grep sudo /var/log/auth.log
   
   # View last login
   last username
   
   # View failed login attempts
   sudo grep "Failed password" /var/log/auth.log
   ```

### Questions to Answer:

- Why use `visudo` instead of editing sudoers directly?
- How do you restrict sudo access to specific commands?

---

## Exercise 4: File Permissions and ACLs

**Objective:** Secure files and directories.

### Tasks:

1. **Audit file permissions**
   ```bash
   # Find files with world-writable permissions
   find /home -type f -perm -002
   
   # Find files with SUID
   find /usr -type f -perm -4000
   
   # Find files with SGID
   find /usr -type f -perm -2000
   
   # Find files owned by root but writable by group/others
   find / -user root \( -perm -g+w -o -perm -o+w \)
   ```

2. **Fix insecure permissions**
   ```bash
   # Remove world-writable permissions
   find /home -type f -perm -002 -exec chmod o-w {} \;
   
   # Secure sensitive files
   chmod 600 ~/.ssh/id_rsa
   chmod 644 ~/.ssh/id_rsa.pub
   chmod 700 ~/.ssh
   ```

3. **Use ACLs for complex permissions**
   ```bash
   # Install ACL support
   sudo apt install acl  # Ubuntu/Debian
   sudo yum install acl  # RedHat/CentOS
   
   # Set ACL
   setfacl -m u:user1:rwx /shared/directory
   setfacl -m g:developers:r-x /shared/directory
   
   # View ACL
   getfacl /shared/directory
   
   # Set default ACL (inherited by new files)
   setfacl -d -m u:user1:rwx /shared/directory
   ```

### Questions to Answer:

- When would you use ACLs instead of standard permissions?
- How do you remove all ACLs from a file?

---

## Exercise 5: Security Hardening Script

**Objective:** Create a comprehensive security hardening script.

### Tasks:

Create `harden_server.sh` that:

1. **SSH Hardening**
   - Disable root login
   - Disable password authentication
   - Change default port
   - Set connection limits

2. **Firewall Configuration**
   - Enable firewall
   - Allow only necessary ports
   - Set default deny policy

3. **System Updates**
   - Update package lists
   - Install security updates
   - Configure automatic updates

4. **Remove Unnecessary Services**
   - List running services
   - Disable unused services

5. **Configure Logging**
   - Enable audit logging
   - Configure log rotation

6. **File Permissions**
   - Audit and fix insecure permissions
   - Secure sensitive files

### Deliverables:

- Working hardening script
- Documentation of changes
- Rollback procedure

---

## Exercise 6: Security Audit

**Objective:** Perform a security audit of a system.

### Tasks:

1. **Check for security updates**
   ```bash
   sudo apt list --upgradable | grep -i security
   ```

2. **Check for open ports**
   ```bash
   sudo ss -tuln
   sudo netstat -tuln
   ```

3. **Check user accounts**
   ```bash
   # List all users
   cut -d: -f1 /etc/passwd
   
   # Check for users with no password
   sudo awk -F: '($2 == "") {print $1}' /etc/shadow
   
   # Check for users with UID 0 (root)
   awk -F: '($3 == 0) {print $1}' /etc/passwd
   ```

4. **Check sudo access**
   ```bash
   sudo grep -E "^[^#].*ALL.*ALL" /etc/sudoers
   ```

5. **Check for suspicious processes**
   ```bash
   ps aux --sort=-%cpu | head -20
   ps aux --sort=-%mem | head -20
   ```

6. **Use security tools**
   ```bash
   # Install lynis
   sudo apt install lynis
   
   # Run security audit
   sudo lynis audit system
   ```

### Deliverables:

- Security audit report
- List of findings
- Recommendations for improvement

---

**Next:** [Networking Exercises](../05-networking/)

