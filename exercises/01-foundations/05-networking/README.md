# Networking - Exercises

## Exercise 1: Network Protocol Analysis

**Objective:** Understand network protocols and analyze traffic.

### Tasks:

1. **Examine network interfaces**
   ```bash
   # List all interfaces
   ip link show
   
   # Show interface details
   ip addr show eth0
   
   # Show interface statistics
   ip -s link show eth0
   ```

2. **Analyze network connections**
   ```bash
   # Show all connections
   ss -tuln
   
   # Show listening ports
   ss -tuln | grep LISTEN
   
   # Show connections by process
   ss -tulnp
   
   # Show connections to specific port
   ss -tuln | grep :80
   ```

3. **Use tcpdump** (if available)
   ```bash
   # Install tcpdump
   sudo apt install tcpdump
   
   # Capture packets on interface
   sudo tcpdump -i eth0
   
   # Capture specific port
   sudo tcpdump -i eth0 port 80
   
   # Capture and save to file
   sudo tcpdump -i eth0 -w capture.pcap
   ```

### Questions to Answer:

- What's the difference between TCP and UDP?
- How do you identify which process is using a port?

---

## Exercise 2: DNS Configuration and Testing

**Objective:** Configure and test DNS resolution.

### Tasks:

1. **Examine DNS configuration**
   ```bash
   # View current DNS servers
   cat /etc/resolv.conf
   
   # Check systemd-resolved (if used)
   systemd-resolve --status
   ```

2. **Test DNS resolution**
   ```bash
   # Using nslookup
   nslookup google.com
   nslookup google.com 8.8.8.8
   
   # Using dig
   dig google.com
   dig @8.8.8.8 google.com
   dig google.com MX
   dig google.com NS
   
   # Using host
   host google.com
   host -t MX google.com
   ```

3. **Configure DNS**
   ```bash
   # Edit resolv.conf (temporary)
   sudo nano /etc/resolv.conf
   ```
   
   Add:
   ```
   nameserver 8.8.8.8
   nameserver 8.8.4.4
   ```
   
   ```bash
   # Test new configuration
   dig google.com
   ```

4. **Use /etc/hosts**
   ```bash
   # Edit hosts file
   sudo nano /etc/hosts
   ```
   
   Add:
   ```
   192.168.1.100  myserver.local
   ```
   
   ```bash
   # Test
   ping myserver.local
   ```

### Questions to Answer:

- What's the order of DNS resolution?
- How does /etc/hosts affect DNS resolution?

---

## Exercise 3: Network Connectivity Testing

**Objective:** Test and troubleshoot network connectivity.

### Tasks:

1. **Test basic connectivity**
   ```bash
   # Ping test
   ping -c 4 8.8.8.8
   ping -c 4 google.com
   
   # Ping with interval
   ping -i 2 8.8.8.8
   
   # Ping with timeout
   ping -W 5 8.8.8.8
   ```

2. **Trace network path**
   ```bash
   # Using traceroute
   traceroute google.com
   
   # Using tracepath
   tracepath google.com
   
   # Using mtr (if available)
   mtr google.com
   ```

3. **Test specific ports**
   ```bash
   # Using telnet
   telnet google.com 80
   
   # Using nc (netcat)
   nc -zv google.com 80
   nc -zv google.com 443
   
   # Using curl
   curl -I http://google.com
   curl -I https://google.com
   ```

4. **Check routing**
   ```bash
   # View routing table
   ip route show
   route -n
   
   # Add route (temporary)
   sudo ip route add 192.168.2.0/24 via 192.168.1.1
   
   # Delete route
   sudo ip route del 192.168.2.0/24
   ```

### Questions to Answer:

- What does traceroute show?
- How do you test if a firewall is blocking a port?

---

## Exercise 4: Subnet Calculations

**Objective:** Understand subnetting and CIDR notation.

### Tasks:

1. **Calculate subnets**
   - Given network: 192.168.1.0/24
     - How many hosts?
     - What's the subnet mask?
     - What's the broadcast address?
   
   - Given network: 10.0.0.0/16
     - How many subnets if divided into /24?
     - What are the subnet ranges?

2. **Use ipcalc** (if available)
   ```bash
   # Install ipcalc
   sudo apt install ipcalc
   
   # Calculate subnet
   ipcalc 192.168.1.0/24
   ipcalc 10.0.0.0/16
   ```

3. **Practice scenarios**
   - You need 50 hosts per subnet from 172.16.0.0/16
     - What subnet mask?
     - How many subnets?
   
   - You have 192.168.1.0/24 and need 4 subnets
     - What are the subnet ranges?
     - How many hosts per subnet?

### Questions to Answer:

- What's the difference between /24 and /16?
- How do you calculate the number of hosts in a subnet?

---

## Exercise 5: Network Troubleshooting

**Objective:** Troubleshoot common network issues.

### Scenarios:

1. **Cannot reach internet**
   ```bash
   # Check default gateway
   ip route | grep default
   
   # Ping gateway
   ping -c 4 $(ip route | grep default | awk '{print $3}')
   
   # Check DNS
   dig google.com
   
   # Check firewall
   sudo ufw status
   ```

2. **Cannot reach specific host**
   ```bash
   # Ping test
   ping hostname
   
   # DNS resolution
   nslookup hostname
   
   # Port test
   nc -zv hostname port
   
   # Check routing
   traceroute hostname
   ```

3. **Port not accessible**
   ```bash
   # Check if service is listening
   ss -tuln | grep :port
   
   # Check firewall
   sudo ufw status | grep port
   
   # Test from localhost
   curl localhost:port
   ```

### Deliverables:

- Troubleshooting checklist
- Common solutions
- Diagnostic commands

---

**Next:** [Development Basics Exercises](../06-development-basics/)

