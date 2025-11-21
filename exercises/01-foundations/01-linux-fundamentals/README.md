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
  - 📚 **Answer**: See [File System Hierarchy - /bin and /usr](../../../docs/01-foundations.md#1-file-system-hierarchy)
- Why is `/etc` important for system administration?
  - 📚 **Answer**: See [/etc - Configuration Files](../../../docs/01-foundations.md#etc---configuration-files)
- What happens to files in `/tmp` on reboot?
  - 📚 **Answer**: See [/tmp - Temporary Files](../../../docs/01-foundations.md#tmp---temporary-files)

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
  - 📚 **Answer**: See [Users, Groups, and Permissions](../../../docs/01-foundations.md#2-users-groups-and-permissions)
- What UID does root have?
  - 📚 **Answer**: See [/etc/passwd - User Accounts](../../../docs/01-foundations.md#etcpasswd---user-accounts)
- Why should you use `-aG` instead of `-G` when adding users to groups?
  - 📚 **Answer**: See [User Management](../../../docs/01-foundations.md#2-users-groups-and-permissions)

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
  - 📚 **Answer**: See [File Permissions](../../../docs/01-foundations.md#3-file-permissions-and-ownership)
- When would you use SUID?
  - 📚 **Answer**: See [Special Permissions](../../../docs/01-foundations.md#special-permissions)
- What's the difference between SUID and SGID?
  - 📚 **Answer**: See [Special Permissions](../../../docs/01-foundations.md#special-permissions)

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
  - 📚 **Answer**: See [Process Management](../../../docs/01-foundations.md#3-process-management)
- When would you use `nohup` vs regular background jobs?
  - 📚 **Answer**: See [Process Management](../../../docs/01-foundations.md#3-process-management)
- What does a zombie process mean?
  - 📚 **Answer**: See [Process Management](../../../docs/01-foundations.md#3-process-management)

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
  - 📚 **Answer**: See [System Services (systemd)](../../../docs/01-foundations.md#4-system-services-systemd)
- When would you use `reload` vs `restart`?
  - 📚 **Answer**: See [System Services (systemd)](../../../docs/01-foundations.md#4-system-services-systemd)
- What is a systemd unit?
  - 📚 **Answer**: See [System Services (systemd)](../../../docs/01-foundations.md#4-system-services-systemd)

---

## Exercise 6: Complete System Setup

**Objective:** Apply all concepts in a practical scenario.

### Scenario:

You need to set up a new Linux server for a development team.

### Tasks:

1. **Create directory structure**
   - Create `/opt/dev-team` directory
   - Create subdirectories: `projects`, `scripts`, `logs`
   - Set appropriate permissions

2. **Create user accounts**
   - Create users: `dev1`, `dev2`, `dev3`
   - Create group: `developers`
   - Add all users to `developers` group
   - Set up home directories

3. **Configure permissions**
   - Make `/opt/dev-team` accessible to developers group
   - Set SGID on `/opt/dev-team/projects` so new files inherit group
   - Ensure only owners can delete files in shared directories

4. **Set up a service**
   - Create a simple backup script
   - Create a systemd service to run it daily
   - Enable and test the service

5. **Document your work**
   - Create a README with all commands used
   - Document the permission structure
   - Explain why you made each decision

### Deliverables:

- A script that automates the setup
- Documentation of the final state
- Explanation of security considerations

---

## Additional Challenges

1. **Permission Audit**: Write a script that audits file permissions in `/etc` and reports any files with overly permissive settings.

2. **Process Monitor**: Create a script that monitors system processes and alerts when CPU or memory usage exceeds thresholds.

3. **User Management Script**: Create a script that automates user creation with proper home directories, groups, and initial permissions.

---

**Next:** [Shell Scripting Exercises](../02-shell-scripting/)

