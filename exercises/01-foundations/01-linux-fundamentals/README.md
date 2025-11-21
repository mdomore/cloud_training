# Linux Fundamentals - Exercises

**📚 Before starting:** Make sure you understand the `sudo` command - see [Understanding sudo](../../../docs/01-foundations.md#25-understanding-sudo)

## Exercise 1: File System Navigation

**Objective:** Master basic file system navigation and understanding.

### Tasks:

1. **Explore the file system hierarchy**
   ```bash
   # Navigate to root directory
   cd /
   
   # List all top-level directories
   ls -la /
   
   # For each major directory (/bin, /etc, /var, /usr, /opt), answer:
   # - What is its purpose?
   # - What types of files are stored there?
   # - Can regular users write to it?
   #
   # 📚 Reference: See documentation for answers:
   # - /bin: ../../docs/01-foundations.md#bin-and-sbin---essential-binaries
   # - /etc: ../../docs/01-foundations.md#etc---configuration-files
   # - /var: ../../docs/01-foundations.md#var---variable-data
   # - /usr: ../../docs/01-foundations.md#usr---user-programs
   # - /opt: ../../docs/01-foundations.md#opt---optional-software
   # Full section: ../../docs/01-foundations.md#1-file-system-hierarchy
   ```

2. **Find and analyze system files**
   ```bash
   # Find all .conf files in /etc
   find /etc -name "*.conf" | head -10
   
   # Check the size of /var/log directory
   du -sh /var/log
   
   # List the 10 largest files in /usr
   find /usr -type f -exec du -h {} + | sort -rh | head -10
   ```

3. **Create a directory structure**
   ```bash
   # Create a test directory structure
   mkdir -p ~/linux-practice/{bin,etc,var/log,home/user1}
   
   # Create some test files
   touch ~/linux-practice/etc/config.conf
   touch ~/linux-practice/var/log/app.log
   
   # Verify the structure
   tree ~/linux-practice  # or: find ~/linux-practice
   ```

### Questions to Answer:

- What is the difference between `/bin` and `/usr/bin`?
- Why is `/etc` important for system administration?
- What happens to files in `/tmp` on reboot?

---

## Exercise 2: Users and Groups

**Objective:** Understand user and group management.

### Tasks:

1. **Examine existing users and groups**
   ```bash
   # View all users
   cat /etc/passwd
   
   # View all groups
   cat /etc/group
   
   # Check your current user information
   id
   groups
   ```

2. **Create and manage users** (requires sudo)
   
   **📚 Reference:** [Understanding sudo](../../../docs/01-foundations.md#25-understanding-sudo) - Learn about sudo before attempting this
   
   ```bash
   # Create a new user
   sudo useradd -m -s /bin/bash testuser
   
   # Set a password
   sudo passwd testuser
   
   # Create a group
   sudo groupadd developers
   
   # Add user to group
   sudo usermod -aG developers testuser
   
   # Verify
   groups testuser
   id testuser
   ```

3. **Modify user properties**
   ```bash
   # Change user's home directory
   sudo usermod -d /home/newhome testuser
   
   # Change user's shell
   sudo usermod -s /bin/zsh testuser
   
   # Lock user account
   sudo usermod -L testuser
   
   # Unlock user account
   sudo usermod -U testuser
   ```

4. **Clean up** (when done)
   ```bash
   sudo userdel -r testuser
   sudo groupdel developers
   ```

### Questions to Answer:

- What is the difference between primary and secondary groups?
- What UID does root have?
- Why should you use `-aG` instead of `-G` when adding users to groups?

---

## Exercise 3: File Permissions

**Objective:** Master file permissions and ownership.

### Tasks:

1. **Understand current permissions**
   ```bash
   # Create test files
   touch ~/test1.txt ~/test2.txt ~/test3.txt
   
   # View permissions
   ls -l ~/test*.txt
   
   # Explain what each part means:
   # -rw-r--r-- 1 user group 0 date test1.txt
   ```

2. **Change permissions using symbolic notation**
   ```bash
   # Add execute permission for owner
   chmod u+x ~/test1.txt
   
   # Remove write permission for group
   chmod g-w ~/test2.txt
   
   # Set read-only for others
   chmod o=r ~/test3.txt
   
   # Verify changes
   ls -l ~/test*.txt
   ```

3. **Change permissions using octal notation**
   ```bash
   # Set permissions to 755 (rwxr-xr-x)
   chmod 755 ~/test1.txt
   
   # Set permissions to 600 (rw-------)
   chmod 600 ~/test2.txt
   
   # Set permissions to 644 (rw-r--r--)
   chmod 644 ~/test3.txt
   ```

4. **Change ownership** (requires sudo)
   ```bash
   # Change owner
   sudo chown testuser ~/test1.txt
   
   # Change owner and group
   sudo chown testuser:developers ~/test2.txt
   
   # Change recursively
   sudo chown -R testuser:developers ~/linux-practice
   ```

5. **Work with special permissions**
   ```bash
   # Create a script
   echo '#!/bin/bash\necho "Hello from script"' > ~/myscript.sh
   chmod +x ~/myscript.sh
   
   # Set SUID (requires sudo)
   sudo chown root:root ~/myscript.sh
   sudo chmod 4755 ~/myscript.sh
   
   # Verify SUID is set
   ls -l ~/myscript.sh  # Look for 's' in user execute position
   
   # Create directory with SGID
   mkdir ~/shared
   sudo chgrp developers ~/shared
   sudo chmod 2775 ~/shared
   
   # Verify SGID
   ls -ld ~/shared  # Look for 's' in group execute position
   ```

### Questions to Answer:

- What does 755 mean in octal notation?
- When would you use SUID?
- What's the difference between SUID and SGID?

---

## Exercise 4: Process Management

**Objective:** Understand and manage processes.

### Tasks:

1. **List and analyze processes**
   ```bash
   # List all processes
   ps aux
   
   # List processes in tree format
   ps auxf
   
   # Find processes using most CPU
   ps aux --sort=-%cpu | head -10
   
   # Find processes using most memory
   ps aux --sort=-%mem | head -10
   
   # Find processes by user
   ps aux | grep $USER
   ```

2. **Monitor processes in real-time**
   ```bash
   # Use top (press 'q' to quit)
   top
   
   # Use htop if available (more user-friendly)
   htop
   
   # Monitor specific process
   watch -n 1 'ps aux | grep nginx'
   ```

3. **Manage background jobs**
   ```bash
   # Start a long-running process in background
   sleep 60 &
   
   # List background jobs
   jobs
   jobs -l
   
   # Bring job to foreground
   fg %1
   
   # Suspend with Ctrl+Z, then resume in background
   bg %1
   
   # Kill a background job
   kill %1
   ```

4. **Use nohup for persistent processes**
   ```bash
   # Start process that survives logout
   nohup sleep 120 > sleep.log 2>&1 &
   
   # Check if it's running
   ps aux | grep sleep
   
   # View output
   cat sleep.log
   ```

5. **Manage process priorities**
   ```bash
   # Start process with low priority
   nice -n 10 sleep 60 &
   
   # Change priority of running process
   renice 10 $(pgrep sleep)
   
   # Check nice value
   ps -o pid,ni,cmd -p $(pgrep sleep)
   ```

### Questions to Answer:

- What's the difference between `ps aux` and `ps -ef`?
- When would you use `nohup` vs regular background jobs?
- What does a zombie process mean?

---

## Exercise 5: systemd Services

**Objective:** Work with systemd services.

### Tasks:

1. **Explore existing services**
   ```bash
   # List all services
   systemctl list-units --type=service
   
   # List only running services
   systemctl list-units --type=service --state=running
   
   # List failed services
   systemctl list-units --type=service --state=failed
   
   # Check status of a service
   sudo systemctl status ssh
   
   # List failed services (Useful for troubleshooting!)
   systemctl --failed
   # or
   systemctl list-units --state=failed
   ```

2. **Manage services**
   ```bash
   # Start a service
   sudo systemctl start nginx  # or another service
   
   # Stop a service
   sudo systemctl stop nginx
   
   # Restart a service
   sudo systemctl restart nginx
   
   # Reload configuration
   sudo systemctl reload nginx
   
   # Enable service on boot
   sudo systemctl enable nginx
   
   # Disable service on boot
   sudo systemctl disable nginx
   ```

3. **View service logs**
   ```bash
   # View logs for a service
   sudo journalctl -u nginx
   
   # Follow logs in real-time
   sudo journalctl -u nginx -f
   
   # View last 50 lines
   sudo journalctl -u nginx -n 50
   
   # View logs since boot
   sudo journalctl -u nginx -b
   ```

4. **Create a custom service** (advanced)
   ```bash
   # Create a simple service file
   sudo nano /etc/systemd/system/mytest.service
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=My Test Service
   After=network.target
   
   [Service]
   Type=simple
   User=$USER
   ExecStart=/bin/bash -c 'while true; do echo "Service running" >> /tmp/mytest.log; sleep 10; done'
   Restart=always
   RestartSec=10
   
   [Install]
   WantedBy=multi-user.target
   ```
   
   ```bash
   # Reload systemd
   sudo systemctl daemon-reload
   
   # Enable and start service
   sudo systemctl enable mytest.service
   sudo systemctl start mytest.service
   
   # Check status
   sudo systemctl status mytest.service
   
   # View logs
   sudo journalctl -u mytest.service -f
   
   # Stop and remove
   sudo systemctl stop mytest.service
   sudo systemctl disable mytest.service
   sudo rm /etc/systemd/system/mytest.service
   sudo systemctl daemon-reload
   ```

### Questions to Answer:

- What's the difference between `start` and `enable`?
- When would you use `reload` vs `restart`?
- What is a systemd unit?

---

## Exercise 6: Complete System Setup

**Objective:** Apply all concepts in a practical scenario.

### Scenario:

You need to set up a new Linux server for a development team.

### Tasks:

1. **Create directory structure**
   ```bash
   # Create main directory
   sudo mkdir -p /opt/dev-team/{projects,scripts,logs}
   
   # Verify structure
   tree /opt/dev-team
   # or
   ls -laR /opt/dev-team
   
   # Set initial permissions (owner: root, group: developers)
   sudo chown root:developers /opt/dev-team
   sudo chmod 755 /opt/dev-team
   ```

2. **Create user accounts**
   ```bash
   # Create developers group
   sudo groupadd developers
   
   # Create users with home directories
   sudo useradd -m -s /bin/bash -G developers dev1
   sudo useradd -m -s /bin/bash -G developers dev2
   sudo useradd -m -s /bin/bash -G developers dev3
   
   # Set passwords for users
   sudo passwd dev1
   sudo passwd dev2
   sudo passwd dev3
   
   # Verify users and groups
   groups dev1 dev2 dev3
   id dev1
   ```

3. **Configure permissions**
   ```bash
   # Set group ownership on main directory
   sudo chgrp developers /opt/dev-team
   sudo chmod 775 /opt/dev-team
   
   # Set SGID on projects directory (files inherit group)
   sudo chgrp developers /opt/dev-team/projects
   sudo chmod 2775 /opt/dev-team/projects
   # The '2' in 2775 sets SGID bit
   
   # Set sticky bit on projects (only owner can delete)
   sudo chmod +t /opt/dev-team/projects
   # or combine: sudo chmod 3775 /opt/dev-team/projects
   
   # Set permissions on scripts and logs
   sudo chgrp developers /opt/dev-team/scripts
   sudo chmod 775 /opt/dev-team/scripts
   
   sudo chgrp developers /opt/dev-team/logs
   sudo chmod 775 /opt/dev-team/logs
   
   # Verify permissions
   ls -ld /opt/dev-team
   ls -ld /opt/dev-team/projects
   # Should see 's' in group position (SGID) and 't' in others (sticky)
   ```

4. **Set up a service**
   ```bash
   # Create backup script
   sudo nano /opt/dev-team/scripts/backup-projects.sh
   ```
   
   Add this content:
   ```bash
   #!/bin/bash
   # Backup script for dev-team projects
   
   BACKUP_DIR="/opt/dev-team/logs/backups"
   PROJECTS_DIR="/opt/dev-team/projects"
   TIMESTAMP=$(date +%Y%m%d_%H%M%S)
   
   # Create backup directory if it doesn't exist
   mkdir -p "$BACKUP_DIR"
   
   # Create backup
   tar -czf "$BACKUP_DIR/projects_backup_$TIMESTAMP.tar.gz" "$PROJECTS_DIR" 2>/dev/null
   
   # Keep only last 7 backups
   ls -t "$BACKUP_DIR"/projects_backup_*.tar.gz | tail -n +8 | xargs rm -f
   
   # Log backup operation
   echo "$(date): Backup completed - projects_backup_$TIMESTAMP.tar.gz" >> "$BACKUP_DIR/backup.log"
   ```
   
   ```bash
   # Make script executable
   sudo chmod +x /opt/dev-team/scripts/backup-projects.sh
   sudo chown root:developers /opt/dev-team/scripts/backup-projects.sh
   
   # Create systemd service
   sudo nano /etc/systemd/system/dev-team-backup.service
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=Dev Team Projects Backup Service
   After=network.target
   
   [Service]
   Type=oneshot
   User=root
   ExecStart=/opt/dev-team/scripts/backup-projects.sh
   StandardOutput=journal
   StandardError=journal
   
   [Install]
   WantedBy=multi-user.target
   ```
   
   ```bash
   # Create timer for daily execution
   sudo nano /etc/systemd/system/dev-team-backup.timer
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=Run Dev Team Backup Daily
   Requires=dev-team-backup.service
   
   [Timer]
   OnCalendar=daily
   Persistent=true
   
   [Install]
   WantedBy=timers.target
   ```
   
   ```bash
   # Reload systemd and enable timer
   sudo systemctl daemon-reload
   sudo systemctl enable dev-team-backup.timer
   sudo systemctl start dev-team-backup.timer
   
   # Check timer status
   sudo systemctl status dev-team-backup.timer
   
   # Test the service manually
   sudo systemctl start dev-team-backup.service
   sudo systemctl status dev-team-backup.service
   
   # Verify backup was created
   ls -lh /opt/dev-team/logs/backups/
   ```

5. **Document your work**
   ```bash
   # Create documentation
   sudo nano /opt/dev-team/README.md
   ```
   
   Document:
   - Directory structure and purpose
   - User accounts and groups
   - Permission structure and rationale
   - Service configuration
   - Security considerations

### Complete Setup Script

Here's a complete script that automates the entire setup:

```bash
#!/bin/bash
# Complete system setup script for dev-team

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting dev-team server setup...${NC}"

# 1. Create directory structure
echo -e "${YELLOW}Creating directory structure...${NC}"
sudo mkdir -p /opt/dev-team/{projects,scripts,logs/backups}
sudo chown root:developers /opt/dev-team
sudo chmod 755 /opt/dev-team

# 2. Create group and users
echo -e "${YELLOW}Creating users and groups...${NC}"
sudo groupadd -f developers

for user in dev1 dev2 dev3; do
    if ! id "$user" &>/dev/null; then
        sudo useradd -m -s /bin/bash -G developers "$user"
        echo -e "${GREEN}Created user: $user${NC}"
    else
        echo -e "${YELLOW}User $user already exists${NC}"
    fi
done

# 3. Configure permissions
echo -e "${YELLOW}Configuring permissions...${NC}"
sudo chgrp developers /opt/dev-team
sudo chmod 775 /opt/dev-team

# Projects: SGID + sticky bit
sudo chgrp developers /opt/dev-team/projects
sudo chmod 3775 /opt/dev-team/projects

# Scripts and logs
sudo chgrp developers /opt/dev-team/scripts
sudo chmod 775 /opt/dev-team/scripts

sudo chgrp developers /opt/dev-team/logs
sudo chmod 775 /opt/dev-team/logs

# 4. Create backup script
echo -e "${YELLOW}Creating backup script...${NC}"
sudo tee /opt/dev-team/scripts/backup-projects.sh > /dev/null << 'EOF'
#!/bin/bash
BACKUP_DIR="/opt/dev-team/logs/backups"
PROJECTS_DIR="/opt/dev-team/projects"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/projects_backup_$TIMESTAMP.tar.gz" "$PROJECTS_DIR" 2>/dev/null
ls -t "$BACKUP_DIR"/projects_backup_*.tar.gz | tail -n +8 | xargs rm -f
echo "$(date): Backup completed - projects_backup_$TIMESTAMP.tar.gz" >> "$BACKUP_DIR/backup.log"
EOF

sudo chmod +x /opt/dev-team/scripts/backup-projects.sh
sudo chown root:developers /opt/dev-team/scripts/backup-projects.sh

# 5. Create systemd service
echo -e "${YELLOW}Creating systemd service...${NC}"
sudo tee /etc/systemd/system/dev-team-backup.service > /dev/null << 'EOF'
[Unit]
Description=Dev Team Projects Backup Service
After=network.target

[Service]
Type=oneshot
User=root
ExecStart=/opt/dev-team/scripts/backup-projects.sh
StandardOutput=journal
StandardError=journal
EOF

# 6. Create systemd timer
sudo tee /etc/systemd/system/dev-team-backup.timer > /dev/null << 'EOF'
[Unit]
Description=Run Dev Team Backup Daily
Requires=dev-team-backup.service

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
EOF

# 7. Enable and start timer
sudo systemctl daemon-reload
sudo systemctl enable dev-team-backup.timer
sudo systemctl start dev-team-backup.timer

echo -e "${GREEN}Setup complete!${NC}"
echo -e "${YELLOW}Verification:${NC}"
echo "Directory structure:"
ls -laR /opt/dev-team
echo ""
echo "Users:"
groups dev1 dev2 dev3
echo ""
echo "Timer status:"
sudo systemctl status dev-team-backup.timer --no-pager
```

### Verification Commands

```bash
# Check directory structure
tree /opt/dev-team
ls -ld /opt/dev-team /opt/dev-team/*

# Verify permissions (look for 's' = SGID, 't' = sticky)
ls -ld /opt/dev-team/projects

# Check users and groups
id dev1
groups dev1 dev2 dev3

# Test service
sudo systemctl start dev-team-backup.service
sudo systemctl status dev-team-backup.service

# Check timer
sudo systemctl list-timers dev-team-backup.timer

# Verify backup
ls -lh /opt/dev-team/logs/backups/
```

### Deliverables:

- ✅ A script that automates the setup (provided above)
- ✅ Documentation of the final state (create README.md)
- ✅ Explanation of security considerations:
  - **SGID on projects**: Ensures new files belong to developers group
  - **Sticky bit**: Prevents users from deleting each other's files
  - **Group permissions**: Allows collaboration while maintaining security
  - **Service runs as root**: Necessary for system-wide backups
  - **Timer**: Automated daily backups without manual intervention

---

## Additional Challenges

### Challenge 1: Permission Audit Script

Write a script that audits file permissions in `/etc` and reports any files with overly permissive settings.

**Solution:**

```bash
#!/bin/bash
# permission_audit.sh - Audit /etc directory for insecure permissions

AUDIT_LOG="/tmp/etc_permission_audit_$(date +%Y%m%d_%H%M%S).txt"

echo "=== /etc Permission Audit Report ===" > "$AUDIT_LOG"
echo "Generated: $(date)" >> "$AUDIT_LOG"
echo "" >> "$AUDIT_LOG"

# Find world-writable files (dangerous!)
echo "=== World-writable files (SECURITY RISK!) ===" >> "$AUDIT_LOG"
find /etc -type f -perm -002 2>/dev/null | while read file; do
    ls -l "$file" >> "$AUDIT_LOG"
done

# Find files writable by group (potentially risky)
echo "" >> "$AUDIT_LOG"
echo "=== Group-writable files ===" >> "$AUDIT_LOG"
find /etc -type f -perm -020 2>/dev/null | while read file; do
    ls -l "$file" >> "$AUDIT_LOG"
done

# Find files with unusual permissions (not 644 or 600)
echo "" >> "$AUDIT_LOG"
echo "=== Files with non-standard permissions ===" >> "$AUDIT_LOG"
find /etc -type f ! -perm 644 ! -perm 600 ! -perm 640 ! -perm 755 ! -perm 750 2>/dev/null | while read file; do
    perms=$(stat -c "%a" "$file")
    ls -l "$file" >> "$AUDIT_LOG"
done

# Find files owned by non-root users
echo "" >> "$AUDIT_LOG"
echo "=== Files not owned by root ===" >> "$AUDIT_LOG"
find /etc -type f ! -user root 2>/dev/null | while read file; do
    ls -l "$file" >> "$AUDIT_LOG"
done

# Summary
echo "" >> "$AUDIT_LOG"
echo "=== Summary ===" >> "$AUDIT_LOG"
echo "World-writable files: $(find /etc -type f -perm -002 2>/dev/null | wc -l)" >> "$AUDIT_LOG"
echo "Group-writable files: $(find /etc -type f -perm -020 2>/dev/null | wc -l)" >> "$AUDIT_LOG"
echo "Non-root owned files: $(find /etc -type f ! -user root 2>/dev/null | wc -l)" >> "$AUDIT_LOG"

cat "$AUDIT_LOG"
echo ""
echo "Full report saved to: $AUDIT_LOG"
```

**Usage:**
```bash
chmod +x permission_audit.sh
sudo ./permission_audit.sh
```

---

### Challenge 2: Process Monitor Script

Create a script that monitors system processes and alerts when CPU or memory usage exceeds thresholds.

**Solution:**

```bash
#!/bin/bash
# process_monitor.sh - Monitor processes and alert on high usage

CPU_THRESHOLD=80    # CPU usage percentage
MEM_THRESHOLD=80    # Memory usage percentage
ALERT_LOG="/tmp/process_alerts.log"

# Function to send alert
send_alert() {
    local process=$1
    local metric=$2
    local value=$3
    local threshold=$4
    
    echo "$(date): ALERT - Process '$process' exceeded ${metric} threshold: ${value}% (threshold: ${threshold}%)" >> "$ALERT_LOG"
    echo "⚠️  ALERT: $process - ${metric}: ${value}% (threshold: ${threshold}%)"
}

# Monitor processes
ps aux | tail -n +2 | while read user pid cpu mem vsz rss tty stat start time command; do
    # Skip header and extract values
    cpu_val=$(echo "$cpu" | sed 's/%//')
    mem_val=$(echo "$mem" | sed 's/%//')
    
    # Check CPU threshold
    if (( $(echo "$cpu_val > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "$command" "CPU" "$cpu_val" "$CPU_THRESHOLD"
    fi
    
    # Check memory threshold
    if (( $(echo "$mem_val > $MEM_THRESHOLD" | bc -l) )); then
        send_alert "$command" "Memory" "$mem_val" "$MEM_THRESHOLD"
    fi
done

# Alternative simpler version (if bc not available)
echo ""
echo "=== Top CPU Consumers ==="
ps aux --sort=-%cpu | head -6

echo ""
echo "=== Top Memory Consumers ==="
ps aux --sort=-%mem | head -6

echo ""
echo "Alerts logged to: $ALERT_LOG"
```

**Enhanced version with continuous monitoring:**

```bash
#!/bin/bash
# process_monitor_continuous.sh - Continuous process monitoring

CPU_THRESHOLD=80
MEM_THRESHOLD=80
CHECK_INTERVAL=5  # seconds
ALERT_LOG="/tmp/process_alerts.log"

echo "Starting process monitor (CPU: ${CPU_THRESHOLD}%, MEM: ${MEM_THRESHOLD}%)"
echo "Press Ctrl+C to stop"
echo ""

while true; do
    # Get top processes
    ps aux --sort=-%cpu | head -6 | tail -5 | while read user pid cpu mem vsz rss tty stat start time command; do
        cpu_val=$(echo "$cpu" | sed 's/%//' | awk '{print int($1)}')
        mem_val=$(echo "$mem" | sed 's/%//' | awk '{print int($1)}')
        
        if [ "$cpu_val" -gt "$CPU_THRESHOLD" ] 2>/dev/null; then
            echo "$(date): CPU ALERT - PID $pid ($command): ${cpu_val}%" | tee -a "$ALERT_LOG"
        fi
        
        if [ "$mem_val" -gt "$MEM_THRESHOLD" ] 2>/dev/null; then
            echo "$(date): MEM ALERT - PID $pid ($command): ${mem_val}%" | tee -a "$ALERT_LOG"
        fi
    done
    
    sleep "$CHECK_INTERVAL"
done
```

**Usage:**
```bash
chmod +x process_monitor.sh
./process_monitor.sh

# For continuous monitoring
chmod +x process_monitor_continuous.sh
./process_monitor_continuous.sh
```

---

### Challenge 3: User Management Script

Create a script that automates user creation with proper home directories, groups, and initial permissions.

**Solution:**

```bash
#!/bin/bash
# user_management.sh - Automated user creation script

set -euo pipefail

# Configuration
DEFAULT_SHELL="/bin/bash"
DEFAULT_GROUP="users"
SKEL_DIR="/etc/skel"

# Function to create user
create_user() {
    local username=$1
    local groups=${2:-$DEFAULT_GROUP}
    local shell=${3:-$DEFAULT_SHELL}
    local comment=${4:-""}
    
    # Check if user exists
    if id "$username" &>/dev/null; then
        echo "❌ User '$username' already exists"
        return 1
    fi
    
    # Create user with home directory
    if [ -n "$comment" ]; then
        sudo useradd -m -s "$shell" -c "$comment" -G "$groups" "$username"
    else
        sudo useradd -m -s "$shell" -G "$groups" "$username"
    fi
    
    # Set up home directory permissions
    sudo chmod 755 "/home/$username"
    
    # Create standard directories
    sudo mkdir -p "/home/$username/{Documents,Downloads,Projects}"
    sudo chown -R "$username:$username" "/home/$username"
    
    # Set up SSH directory
    sudo mkdir -p "/home/$username/.ssh"
    sudo chmod 700 "/home/$username/.ssh"
    sudo chown "$username:$username" "/home/$username/.ssh"
    
    echo "✅ User '$username' created successfully"
    echo "   Home: /home/$username"
    echo "   Shell: $shell"
    echo "   Groups: $(groups $username | cut -d: -f2)"
    
    return 0
}

# Function to create group
create_group() {
    local groupname=$1
    local gid=${2:-""}
    
    if getent group "$groupname" &>/dev/null; then
        echo "⚠️  Group '$groupname' already exists"
        return 1
    fi
    
    if [ -n "$gid" ]; then
        sudo groupadd -g "$gid" "$groupname"
    else
        sudo groupadd "$groupname"
    fi
    
    echo "✅ Group '$groupname' created successfully"
    return 0
}

# Function to add user to group
add_to_group() {
    local username=$1
    local groupname=$2
    
    if ! id "$username" &>/dev/null; then
        echo "❌ User '$username' does not exist"
        return 1
    fi
    
    if ! getent group "$groupname" &>/dev/null; then
        echo "❌ Group '$groupname' does not exist"
        return 1
    fi
    
    sudo usermod -aG "$groupname" "$username"
    echo "✅ Added '$username' to group '$groupname'"
    return 0
}

# Function to delete user
delete_user() {
    local username=$1
    local remove_home=${2:-false}
    
    if ! id "$username" &>/dev/null; then
        echo "❌ User '$username' does not exist"
        return 1
    fi
    
    if [ "$remove_home" = true ]; then
        sudo userdel -r "$username"
        echo "✅ User '$username' deleted (home directory removed)"
    else
        sudo userdel "$username"
        echo "✅ User '$username' deleted (home directory kept)"
    fi
    
    return 0
}

# Main menu
show_menu() {
    echo "=== User Management Script ==="
    echo "1. Create user"
    echo "2. Create group"
    echo "3. Add user to group"
    echo "4. Delete user"
    echo "5. Batch create users from file"
    echo "6. Exit"
    echo ""
    read -p "Select option: " choice
    
    case $choice in
        1)
            read -p "Username: " username
            read -p "Groups (comma-separated, default: $DEFAULT_GROUP): " groups
            read -p "Shell (default: $DEFAULT_SHELL): " shell
            read -p "Full name (optional): " comment
            create_user "$username" "${groups:-$DEFAULT_GROUP}" "${shell:-$DEFAULT_SHELL}" "$comment"
            ;;
        2)
            read -p "Group name: " groupname
            read -p "GID (optional): " gid
            create_group "$groupname" "$gid"
            ;;
        3)
            read -p "Username: " username
            read -p "Group name: " groupname
            add_to_group "$username" "$groupname"
            ;;
        4)
            read -p "Username: " username
            read -p "Remove home directory? (y/n): " remove_home
            delete_user "$username" "$([ "$remove_home" = "y" ] && echo true || echo false)"
            ;;
        5)
            read -p "Path to user list file: " userfile
            batch_create_users "$userfile"
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
}

# Batch user creation from file
batch_create_users() {
    local userfile=$1
    
    if [ ! -f "$userfile" ]; then
        echo "❌ File '$userfile' not found"
        return 1
    fi
    
    while IFS=',' read -r username groups shell comment; do
        [ -z "$username" ] && continue
        create_user "$username" "${groups:-$DEFAULT_GROUP}" "${shell:-$DEFAULT_SHELL}" "$comment"
    done < "$userfile"
}

# Example user file format (users.txt):
# dev1,developers,/bin/bash,Developer One
# dev2,developers,/bin/bash,Developer Two
# admin,admins,sudo,/bin/zsh,Administrator

# Run menu if script is executed directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    show_menu
fi
```

**Usage:**
```bash
chmod +x user_management.sh

# Interactive mode
sudo ./user_management.sh

# Or use functions directly
source user_management.sh
create_user "newuser" "developers,users" "/bin/bash" "New User"
create_group "developers"
add_to_group "newuser" "developers"
```

**Example batch file (users.txt):**
```
dev1,developers,/bin/bash,Developer One
dev2,developers,/bin/bash,Developer Two
dev3,developers,/bin/zsh,Developer Three
```

**Usage with batch file:**
```bash
# Create users from file
while IFS=',' read -r username groups shell comment; do
    source user_management.sh
    create_user "$username" "$groups" "$shell" "$comment"
done < users.txt
```

---



---

---

## Answers

### Exercise 1: File System Navigation

- **What is the difference between `/bin` and `/usr/bin`?**
  📚 **Answer**: See [File System Hierarchy - /bin and /usr](../../../docs/01-foundations.md#1-file-system-hierarchy)

- **Why is `/etc` important for system administration?**
  📚 **Answer**: See [/etc - Configuration Files](../../../docs/01-foundations.md#etc---configuration-files)

- **What happens to files in `/tmp` on reboot?**
  📚 **Answer**: See [/tmp - Temporary Files](../../../docs/01-foundations.md#tmp---temporary-files)

### Exercise 2: Users and Groups

- **What is the difference between primary and secondary groups?**
  📚 **Answer**: See [Users, Groups, and Permissions](../../../docs/01-foundations.md#2-users-groups-and-permissions)

- **What UID does root have?**
  📚 **Answer**: See [/etc/passwd - User Accounts](../../../docs/01-foundations.md#etcpasswd---user-accounts)

- **Why should you use `-aG` instead of `-G` when adding users to groups?**
  📚 **Answer**: See [User Management](../../../docs/01-foundations.md#2-users-groups-and-permissions)

### Exercise 3: File Permissions

- **What does 755 mean in octal notation?**
  📚 **Answer**: See [File Permissions](../../../docs/01-foundations.md#3-file-permissions-and-ownership)

- **When would you use SUID?**
  📚 **Answer**: See [Special Permissions](../../../docs/01-foundations.md#special-permissions)

- **What's the difference between SUID and SGID?**
  📚 **Answer**: See [Special Permissions](../../../docs/01-foundations.md#special-permissions)

### Exercise 4: Process Management

- **What's the difference between `ps aux` and `ps -ef`?**
  📚 **Answer**: See [Process Management](../../../docs/01-foundations.md#3-process-management)

- **When would you use `nohup` vs regular background jobs?**
  📚 **Answer**: See [Process Management](../../../docs/01-foundations.md#3-process-management)

- **What does a zombie process mean?**
  📚 **Answer**: See [Process Management](../../../docs/01-foundations.md#3-process-management)

### Exercise 5: systemd Services

- **What's the difference between `start` and `enable`?**
  📚 **Answer**: See [System Services (systemd)](../../../docs/01-foundations.md#4-system-services-systemd)

- **When would you use `reload` vs `restart`?**
  📚 **Answer**: See [System Services (systemd)](../../../docs/01-foundations.md#4-system-services-systemd)

- **What is a systemd unit?**
  📚 **Answer**: See [System Services (systemd)](../../../docs/01-foundations.md#4-system-services-systemd)

**Next:** [Shell Scripting Exercises](../02-shell-scripting/)

