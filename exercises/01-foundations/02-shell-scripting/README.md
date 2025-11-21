# Shell Scripting - Exercises

## Exercise 1: Basic Script Structure

**Objective:** Create your first shell script with proper structure.

### Tasks:

1. **Create a basic script**
   ```bash
   # Create script file
   nano ~/hello.sh
   ```
   
   Write this content:
   ```bash
   #!/bin/bash
   # Script: hello.sh
   # Purpose: Display a greeting
   # Author: Your Name
   # Date: $(date +%Y-%m-%d)
   
   echo "Hello, World!"
   echo "Current user: $(whoami)"
   echo "Current directory: $(pwd)"
   ```
   
   ```bash
   # Make executable
   chmod +x ~/hello.sh
   
   # Run the script
   ~/hello.sh
   # or
   bash ~/hello.sh
   ```

2. **Add error handling**
   ```bash
   # Modify script to include:
   set -e  # Exit on error
   set -u  # Exit on undefined variable
   set -o pipefail  # Exit on pipe failure
   ```

### Questions to Answer:

- Why do we need `#!/bin/bash` at the top?
  - 📚 **Answer**: See [The Shebang](../../../docs/01-foundations.md#the-shebang)
- What's the difference between `./script.sh` and `bash script.sh`?
  - 📚 **Answer**: See [Running Scripts](../../../docs/01-foundations.md#running-scripts)

---

## Exercise 2: Variables and Special Variables

**Objective:** Master variable usage and special variables.

### Tasks:

1. **Create a script that uses variables**
   ```bash
   #!/bin/bash
   
   # User-defined variables
   NAME="John Doe"
   AGE=30
   CITY="New York"
   
   echo "Name: $NAME"
   echo "Age: $AGE"
   echo "City: $CITY"
   
   # Environment variables
   echo "Home: $HOME"
   echo "User: $USER"
   echo "Shell: $SHELL"
   ```

2. **Use special variables**
   ```bash
   #!/bin/bash
   # Save as special_vars.sh
   
   echo "Script name: $0"
   echo "First argument: $1"
   echo "Second argument: $2"
   echo "Number of arguments: $#"
   echo "All arguments: $@"
   echo "Exit code of last command: $?"
   echo "Process ID: $$"
   ```
   
   Test it:
   ```bash
   chmod +x special_vars.sh
   ./special_vars.sh arg1 arg2 arg3
   ```

3. **Variable operations**
   ```bash
   #!/bin/bash
   
   # Default values
   NAME=${1:-"Guest"}
   PORT=${PORT:-8080}
   
   echo "Hello, $NAME"
   echo "Port: $PORT"
   
   # String manipulation
   TEXT="Hello World"
   echo "Length: ${#TEXT}"
   echo "Uppercase: ${TEXT^^}"
   echo "Lowercase: ${TEXT,,}"
   ```

### Questions to Answer:

- What's the difference between `$@` and `$*`?
  - 📚 **Answer**: See [Special Variables](../../../docs/01-foundations.md#special-variables---what-they-are-and-how-to-use-them)
- When would you use `${VAR:-default}`?
  - 📚 **Answer**: See [Default Values](../../../docs/01-foundations.md#default-values)

---

## Exercise 3: Conditionals

**Objective:** Use conditionals for decision making.

### Tasks:

1. **Basic if/else**
   ```bash
   #!/bin/bash
   
   if [ "$1" == "start" ]; then
       echo "Starting service..."
   elif [ "$1" == "stop" ]; then
       echo "Stopping service..."
   else
       echo "Usage: $0 {start|stop}"
       exit 1
   fi
   ```

2. **File and string tests**
   ```bash
   #!/bin/bash
   
   FILE="$1"
   
   if [ -f "$FILE" ]; then
       echo "$FILE exists and is a regular file"
   elif [ -d "$FILE" ]; then
       echo "$FILE exists and is a directory"
   else
       echo "$FILE does not exist"
   fi
   
   # String comparison
   if [ -z "$USER" ]; then
       echo "USER variable is empty"
   fi
   
   if [ -n "$HOME" ]; then
       echo "HOME is set to: $HOME"
   fi
   ```

3. **Numeric comparisons**
   ```bash
   #!/bin/bash
   
   NUM1=$1
   NUM2=$2
   
   if [ "$NUM1" -gt "$NUM2" ]; then
       echo "$NUM1 is greater than $NUM2"
   elif [ "$NUM1" -eq "$NUM2" ]; then
       echo "$NUM1 equals $NUM2"
   else
       echo "$NUM1 is less than $NUM2"
   fi
   ```

4. **Case statement**
   ```bash
   #!/bin/bash
   
   case "$1" in
       start)
           echo "Starting..."
           ;;
       stop)
           echo "Stopping..."
           ;;
       restart)
           echo "Restarting..."
           ;;
       status)
           echo "Status: Running"
           ;;
       *)
           echo "Usage: $0 {start|stop|restart|status}"
           exit 1
           ;;
   esac
   ```

### Questions to Answer:

- What's the difference between `[ ]` and `[[ ]]`?
  - 📚 **Answer**: See [Test Commands](../../../docs/01-foundations.md#test-commands)
- When would you use `case` instead of `if/elif`?
  - 📚 **Answer**: See [Case Statements](../../../docs/01-foundations.md#case-statements)

---

## Exercise 4: Loops

**Objective:** Master loops for automation.

### Tasks:

1. **For loop with list**
   ```bash
   #!/bin/bash
   
   # Iterate over a list
   for color in red green blue yellow; do
       echo "Color: $color"
   done
   
   # Iterate over files
   for file in *.txt; do
       echo "Processing: $file"
       wc -l "$file"
   done
   ```

2. **For loop with range**
   ```bash
   #!/bin/bash
   
   # Count from 1 to 10
   for i in {1..10}; do
       echo "Number: $i"
   done
   
   # Count with step
   for i in {0..20..2}; do
       echo "Even: $i"
   done
   ```

3. **While loop**
   ```bash
   #!/bin/bash
   
   COUNTER=1
   while [ $COUNTER -le 10 ]; do
       echo "Counter: $COUNTER"
       COUNTER=$((COUNTER + 1))
   done
   
   # Read file line by line
   while IFS= read -r line; do
       echo "Line: $line"
   done < /etc/passwd
   ```

4. **Until loop**
   ```bash
   #!/bin/bash
   
   COUNTER=10
   until [ $COUNTER -eq 0 ]; do
       echo "Countdown: $COUNTER"
       COUNTER=$((COUNTER - 1))
       sleep 1
   done
   echo "Blast off!"
   ```

5. **Loop control**
   ```bash
   #!/bin/bash
   
   # Break example
   for i in {1..20}; do
       if [ $i -eq 10 ]; then
           break
       fi
       echo $i
   done
   
   # Continue example
   for i in {1..10}; do
       if [ $((i % 2)) -eq 0 ]; then
           continue
       fi
       echo "Odd: $i"
   done
   ```

### Questions to Answer:

- When would you use `while` vs `until`?
  - 📚 **Answer**: See [until Loops](../../../docs/01-foundations.md#until-loops)
- How do you break out of nested loops?
  - 📚 **Answer**: See [Loop Control](../../../docs/01-foundations.md#loop-control)

---

## Exercise 5: Functions

**Objective:** Create reusable functions.

### Tasks:

1. **Basic function**
   ```bash
   #!/bin/bash
   
   greet() {
       local name=$1
       echo "Hello, $name!"
   }
   
   greet "Alice"
   greet "Bob"
   ```

2. **Function with return value**
   ```bash
   #!/bin/bash
   
   add() {
       local num1=$1
       local num2=$2
       local sum=$((num1 + num2))
       echo $sum
   }
   
   result=$(add 5 3)
   echo "Sum: $result"
   ```

3. **Function with return code**
   ```bash
   #!/bin/bash
   
   file_exists() {
       if [ -f "$1" ]; then
           return 0
       else
           return 1
       fi
   }
   
   if file_exists "/etc/passwd"; then
       echo "File exists"
   else
       echo "File does not exist"
   fi
   ```

4. **Complex function example**
   ```bash
   #!/bin/bash
   
   backup_file() {
       local file=$1
       local backup_dir=${2:-"$HOME/backups"}
       
       if [ ! -f "$file" ]; then
           echo "Error: $file does not exist"
           return 1
       fi
       
       mkdir -p "$backup_dir"
       local timestamp=$(date +%Y%m%d_%H%M%S)
       local backup_name="${file##*/}.${timestamp}"
       
       cp "$file" "$backup_dir/$backup_name"
       echo "Backed up to: $backup_dir/$backup_name"
       return 0
   }
   
   backup_file "/etc/hosts"
   ```

### Questions to Answer:

- What's the difference between `return` and `echo` for function output?
  - 📚 **Answer**: See [Return Values](../../../docs/01-foundations.md#return-values)
- Why use `local` variables in functions?
  - 📚 **Answer**: See [Local Variables](../../../docs/01-foundations.md#local-variables)

---

## Exercise 6: Error Handling

**Objective:** Implement proper error handling.

### Tasks:

1. **Basic error handling**
   ```bash
   #!/bin/bash
   set -e  # Exit on error
   set -u  # Exit on undefined variable
   set -o pipefail  # Exit on pipe failure
   
   # This will exit if command fails
   ls /nonexistent
   echo "This won't be printed"
   ```

2. **Error handling with trap**
   ```bash
   #!/bin/bash
   
   cleanup() {
       echo "Cleaning up..."
       rm -f /tmp/tempfile.*
   }
   
   trap cleanup EXIT
   trap 'echo "Error on line $LINENO"' ERR
   
   # Create temp file
   touch /tmp/tempfile.$$
   
   # Simulate error
   false
   ```

3. **Check command success**
   ```bash
   #!/bin/bash
   
   if ! command -v git &> /dev/null; then
       echo "Error: git is not installed"
       exit 1
   fi
   
   if ! mkdir -p /tmp/test; then
       echo "Error: Failed to create directory"
       exit 1
   fi
   ```

4. **Comprehensive error handling**
   ```bash
   #!/bin/bash
   
   set -euo pipefail
   
   error_exit() {
       echo "Error: $1" >&2
       exit 1
   }
   
   # Usage
   if [ $# -eq 0 ]; then
       error_exit "No arguments provided"
   fi
   
   FILE=$1
   [ -f "$FILE" ] || error_exit "File $FILE does not exist"
   ```

### Questions to Answer:

- What does `set -euo pipefail` do?
  - 📚 **Answer**: See [Error Handling Techniques](../../../docs/01-foundations.md#error-handling-techniques)
- When would you use `trap`?
  - 📚 **Answer**: See [Error Handling Techniques](../../../docs/01-foundations.md#error-handling-techniques)

---

## Exercise 7: Input/Output

**Objective:** Handle input and output effectively.

### Tasks:

1. **Read user input**
   ```bash
   #!/bin/bash
   
   echo "What's your name?"
   read name
   echo "Hello, $name!"
   
   # Read with prompt
   read -p "Enter your age: " age
   echo "You are $age years old"
   
   # Read silently (for passwords)
   read -s -p "Enter password: " password
   echo
   ```

2. **Command-line arguments**
   ```bash
   #!/bin/bash
   
   # Process arguments
   while [[ $# -gt 0 ]]; do
       case $1 in
           -f|--file)
               FILE="$2"
               shift 2
               ;;
           -v|--verbose)
               VERBOSE=1
               shift
               ;;
           *)
               echo "Unknown option: $1"
               exit 1
               ;;
       esac
   done
   
   echo "File: ${FILE:-not specified}"
   echo "Verbose: ${VERBOSE:-0}"
   ```

3. **File redirection**
   ```bash
   #!/bin/bash
   
   # Redirect output
   echo "Hello" > output.txt
   echo "World" >> output.txt
   
   # Redirect errors
   ls /nonexistent 2> error.log
   
   # Redirect both
   command > output.log 2>&1
   
   # Here document
   cat << EOF > config.txt
   Server=localhost
   Port=8080
   Debug=true
   EOF
   ```

4. **Process substitution**
   ```bash
   #!/bin/bash
   
   # Compare two files
   diff <(sort file1.txt) <(sort file2.txt)
   
   # Process while reading
   while read line; do
       echo "Processing: $line"
   done < <(grep "error" /var/log/syslog)
   ```

### Questions to Answer:

- What's the difference between `>` and `>>`?
  - 📚 **Answer**: See [Input/Output](../../../docs/01-foundations.md#7-inputoutput)
- When would you use process substitution?
  - 📚 **Answer**: See [Input/Output](../../../docs/01-foundations.md#7-inputoutput)

---

## Exercise 8: Complete Script Project

**Objective:** Build a complete, production-ready script.

### Project: System Information Script

Create a script `system_info.sh` that:

1. **Displays system information**
   - Hostname
   - Uptime
   - Load average
   - Memory usage
   - Disk usage
   - Top 5 processes by CPU

2. **Features**
   - Accept `-h` or `--help` for usage
   - Accept `-v` or `--verbose` for detailed output
   - Accept `-o FILE` or `--output FILE` to save to file
   - Proper error handling
   - Functions for each section
   - Color output (optional)

3. **Requirements**
   - Use functions
   - Handle errors gracefully
   - Validate input
   - Include comments
   - Follow best practices

### Deliverables:

- Working script
- README with usage instructions
- Example output

---

## Exercise 9: Log Monitoring Script

**Objective:** Create a script that monitors log files.

### Tasks:

Create `log_monitor.sh` that:

1. **Monitors a log file** (default: `/var/log/syslog`)
2. **Filters for specific patterns** (errors, warnings, etc.)
3. **Counts occurrences**
4. **Sends alerts** when threshold is exceeded
5. **Logs its own activity**

### Features:

- Configurable log file path
- Configurable patterns
- Configurable thresholds
- Email alerts (optional)
- Runs continuously or on schedule

---

## Exercise 10: Backup Script

**Objective:** Create an automated backup script.

### Tasks:

Create `backup.sh` that:

1. **Backs up specified directories**
2. **Creates timestamped archives**
3. **Maintains retention policy** (keep last N backups)
4. **Logs backup operations**
5. **Verifies backup integrity**

### Features:

- Configurable source and destination
- Compression options
- Retention policy
- Error handling and reporting
- Can run as cron job

---

## Additional Challenges

1. **User Management Script**: Automate user creation with validation
2. **Service Health Check**: Monitor multiple services and report status
3. **Disk Space Monitor**: Alert when disk usage exceeds thresholds
4. **Network Connectivity Tester**: Test connectivity to multiple hosts

---

**Next:** [System Configuration Exercises](../03-system-configuration/)

