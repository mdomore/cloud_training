# System Configuration - Exercises

## Exercise 1: Network Configuration

**Objective:** Configure and manage network interfaces.

### Tasks:

1. **Examine current network configuration**
   ```bash
   # View all network interfaces
   ip addr show
   # or
   ifconfig
   
   # View routing table
   ip route show
   # or
   route -n
   
   # View network connections
   ss -tuln
   # or
   netstat -tuln
   ```

2. **Configure static IP** (on a test VM or container)
   ```bash
   # Using ip command (temporary)
   sudo ip addr add 192.168.1.100/24 dev eth0
   sudo ip link set eth0 up
   sudo ip route add default via 192.168.1.1
   
   # Verify
   ip addr show eth0
   ping -c 3 8.8.8.8
   ```

3. **Configure DNS**
   ```bash
   # View current DNS
   cat /etc/resolv.conf
   
   # Add DNS servers (temporary)
   echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
   echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf
   
   # Test DNS
   nslookup google.com
   dig google.com
   ```

4. **Network troubleshooting**
   ```bash
   # Test connectivity
   ping -c 4 8.8.8.8
   ping -c 4 google.com
   
   # Trace route
   traceroute google.com
   # or
   tracepath google.com
   
   # Check specific port
   telnet google.com 80
   # or
   nc -zv google.com 80
   ```

### Questions to Answer:

- What's the difference between `ip` and `ifconfig`?
  - 📚 **Answer**: See [Network Configuration](../../../docs/01-foundations.md#1-network-configuration)
- How do you make network configuration persistent?
  - 📚 **Answer**: See [Network Configuration](../../../docs/01-foundations.md#1-network-configuration)

---

## Exercise 2: Package Management

**Objective:** Manage software packages.

### Tasks:

1. **Update package lists** (Ubuntu/Debian)
   ```bash
   sudo apt update
   sudo apt list --upgradable
   ```

2. **Install and remove packages**
   ```bash
   # Install a package
   sudo apt install htop
   
   # Remove a package
   sudo apt remove htop
   
   # Remove with configuration files
   sudo apt purge htop
   
   # Search for packages
   apt search nginx
   ```

3. **Package information**
   ```bash
   # Show package info
   apt show nginx
   
   # List installed packages
   apt list --installed | grep nginx
   
   # Check if package is installed
   dpkg -l | grep nginx
   ```

4. **Update system**
   ```bash
   # Upgrade all packages
   sudo apt upgrade
   
   # Full system upgrade
   sudo apt full-upgrade
   
   # Clean up
   sudo apt autoremove
   sudo apt autoclean
   ```

### For RedHat/CentOS:
   ```bash
   # Update package lists
   sudo yum check-update
   # or
   sudo dnf check-update
   
   # Install package
   sudo yum install htop
   # or
   sudo dnf install htop
   ```

### Questions to Answer:

- What's the difference between `apt upgrade` and `apt full-upgrade`?
  - 📚 **Answer**: See [Package Management](../../../docs/01-foundations.md#2-package-management)
- How do you find which package provides a specific file?
  - 📚 **Answer**: See [Package Management](../../../docs/01-foundations.md#2-package-management)

---

## Exercise 3: Service Management

**Objective:** Manage system services with systemd.

### Tasks:

1. **List and examine services**
   ```bash
   # List all services
   systemctl list-units --type=service
   
   # List running services
   systemctl list-units --type=service --state=running
   
   # Check service status
   sudo systemctl status ssh
   ```

2. **Control services**
   ```bash
   # Start service
   sudo systemctl start nginx
   
   # Stop service
   sudo systemctl stop nginx
   
   # Restart service
   sudo systemctl restart nginx
   
   # Reload configuration
   sudo systemctl reload nginx
   
   # Enable on boot
   sudo systemctl enable nginx
   
   # Disable on boot
   sudo systemctl disable nginx
   ```

3. **View service logs**
   ```bash
   # View logs
   sudo journalctl -u nginx
   
   # Follow logs
   sudo journalctl -u nginx -f
   
   # View since boot
   sudo journalctl -u nginx -b
   
   # View last 50 lines
   sudo journalctl -u nginx -n 50
   ```

### Questions to Answer:

- What's the difference between `restart` and `reload`?
  - 📚 **Answer**: See [Service Management](../../../docs/01-foundations.md#3-service-management)
- How do you check service dependencies?
  - 📚 **Answer**: See [Service Management](../../../docs/01-foundations.md#3-service-management)

---

## Exercise 4: Log Management

**Objective:** Manage and analyze system logs.

### Tasks:

1. **Explore log files**
   ```bash
   # List log files
   ls -lh /var/log/
   
   # View system log
   sudo tail -f /var/log/syslog
   # or on RedHat
   sudo tail -f /var/log/messages
   
   # View auth log
   sudo tail -f /var/log/auth.log
   ```

2. **Use journalctl**
   ```bash
   # View all logs
   sudo journalctl
   
   # View since today
   sudo journalctl --since today
   
   # View since specific time
   sudo journalctl --since "2024-01-27 10:00:00"
   
   # Filter by priority
   sudo journalctl -p err
   sudo journalctl -p warning
   
   # Search logs
   sudo journalctl | grep "error"
   ```

3. **Analyze logs**
   ```bash
   # Count error occurrences
   sudo journalctl -p err | wc -l
   
   # Find most common errors
   sudo journalctl -p err | grep -oE '[A-Z][a-z]+ [A-Z][a-z]+' | sort | uniq -c | sort -rn | head -10
   
   # Monitor failed login attempts
   sudo grep "Failed password" /var/log/auth.log | tail -20
   ```

4. **Configure logrotate** (advanced)
   ```bash
   # View logrotate config
   cat /etc/logrotate.conf
   ls /etc/logrotate.d/
   
   # Create custom logrotate config
   sudo nano /etc/logrotate.d/myapp
   ```
   
   Add:
   ```
   /var/log/myapp/*.log {
       daily
       rotate 7
       compress
       delaycompress
       missingok
       notifempty
   }
   ```

### Questions to Answer:

- What's the difference between `syslog` and `journalctl`?
  - 📚 **Answer**: See [Log Management](../../../docs/01-foundations.md#4-log-management)
- How does logrotate work?
  - 📚 **Answer**: See [Log Management](../../../docs/01-foundations.md#4-log-management)

---

## Exercise 5: Complete System Setup

**Objective:** Configure a complete system from scratch.

### Scenario:

Set up a web server with the following requirements:
- Static IP address
- Nginx web server
- Firewall configured
- Logging configured
- Service enabled on boot

### Tasks:

1. **Network setup**
   - Configure static IP
   - Configure DNS
   - Test connectivity

2. **Install and configure Nginx**
   - Install Nginx
   - Create basic configuration
   - Test web server

3. **Configure firewall**
   - Allow HTTP (80) and HTTPS (443)
   - Allow SSH (22)
   - Deny everything else

4. **Configure logging**
   - Set up log rotation
   - Monitor access logs
   - Set up error alerts

5. **Enable services**
   - Enable Nginx on boot
   - Enable firewall on boot

### Deliverables:

- Documentation of all steps
- Configuration files
- Verification commands

---

**Next:** [Security Basics Exercises](../04-security-basics/)

