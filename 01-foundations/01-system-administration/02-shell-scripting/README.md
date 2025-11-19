# Shell Scripting

## Purpose

Learn to write shell scripts for automation, system administration, and cloud infrastructure management. Master Bash/Zsh scripting to automate repetitive tasks with comprehensive examples and best practices.

## Learning Objectives

By the end of this section, you should be able to:
- Write functional shell scripts with proper structure
- Use variables, conditionals, and loops effectively
- Handle errors and debug scripts
- Follow scripting best practices
- Create production-ready automation scripts

---

## 1. Shell Basics

### Choosing a Shell

#### Bash (Bourne Again Shell)
- Most common shell on Linux systems
- Default on most distributions
- Widely compatible
- Good for system administration scripts

```bash
# Check your shell
echo $SHELL

# Check Bash version
bash --version
```

#### Zsh (Z Shell)
- Enhanced features (autocompletion, themes)
- Popular for interactive use
- Mostly compatible with Bash
- Default on macOS (recent versions)

```bash
# Check if Zsh is installed
which zsh
zsh --version
```

#### Shell Compatibility
- Write scripts for `/bin/sh` for maximum compatibility
- Use `#!/bin/bash` for Bash-specific features
- Test scripts on target systems

### Script Structure

#### The Shebang
The first line tells the system which interpreter to use.

```bash
#!/bin/bash
```

**Important:** Must be the first line, no spaces before `#!`

```bash
# Correct
#!/bin/bash

# Wrong (spaces before)
   #!/bin/bash

# Wrong (not first line)
# Some comment
#!/bin/bash
```

#### Comments
```bash
# Single line comment

# Multi-line comments use multiple # lines
# This is a comment
# This is also a comment

# Inline comment
command  # This explains what the command does
```

#### Executable Permissions
```bash
# Make script executable
chmod +x script.sh

# Or specific permissions
chmod 755 script.sh

# Check permissions
ls -l script.sh
```

#### Running Scripts
```bash
# Method 1: Execute directly (requires executable permission)
./script.sh

# Method 2: Call with interpreter
bash script.sh
sh script.sh

# Method 3: Source the script (runs in current shell)
source script.sh
. script.sh  # Same as source
```

#### Complete Example Script
```bash
#!/bin/bash
# This is a comment
# Script: hello.sh
# Purpose: Display a greeting

echo "Hello, World!"
echo "Current user: $(whoami)"
echo "Current directory: $(pwd)"
```

---

## 2. Variables

### Variable Types

#### User-Defined Variables
```bash
# Assign value (no spaces around =)
NAME="John"
AGE=30

# Use variable
echo $NAME
echo ${NAME}  # Preferred for clarity

# Variables are case-sensitive
name="john"
Name="John"
NAME="JOHN"
```

#### Environment Variables
Predefined variables available to all processes.

```bash
# View all environment variables
env
printenv

# Common environment variables
echo $HOME      # Home directory
echo $USER      # Current user
echo $PATH      # Command search path
echo $PWD       # Current directory
echo $SHELL     # Current shell
echo $HOSTNAME  # Hostname

# Set environment variable for current session
export MY_VAR="value"

# Set for current command only
MY_VAR="value" command
```

#### Special Variables
```bash
# $0 - Script name
echo "Script name: $0"

# $1, $2, $3... - Command-line arguments
echo "First argument: $1"
echo "Second argument: $2"

# $# - Number of arguments
echo "Number of arguments: $#"

# $@ - All arguments as separate words
echo "All arguments: $@"

# $* - All arguments as single string
echo "All arguments as one: $*"

# $? - Exit status of last command
command
echo "Exit status: $?"

# $$ - Process ID of current shell
echo "PID: $$"

# $! - Process ID of last background command
command &
echo "Background PID: $!"

# Example script using special variables
#!/bin/bash
echo "Script: $0"
echo "Arguments: $#"
echo "First arg: $1"
echo "All args: $@"
```

### Variable Operations

#### Assignment and Reading
```bash
# Basic assignment
VAR="value"

# Reading variable
echo $VAR
echo ${VAR}  # Preferred (prevents ambiguity)

# Example where braces are necessary
FILE="test"
echo "File: ${FILE}name"  # Output: File: testname
echo "File: $FILEname"     # Wrong: tries to use $FILEname
```

#### Default Values
```bash
# Use default if variable is unset or empty
${VAR:-default}     # Use default if unset or empty
${VAR-default}     # Use default only if unset
${VAR:=default}    # Assign default if unset or empty
${VAR=default}     # Assign default only if unset
${VAR:+value}      # Use value if VAR is set
${VAR+value}       # Use value if VAR is set (even if empty)
${VAR:?message}    # Error if unset or empty

# Examples
NAME=${1:-"Guest"}           # Use $1 or "Guest"
PORT=${PORT:-8080}           # Use $PORT or 8080
DEBUG=${DEBUG:-false}         # Use $DEBUG or false

# Check if variable is set
if [ -z "${VAR:-}" ]; then
    echo "VAR is not set"
fi
```

#### String Manipulation
```bash
VAR="Hello World"

# Length
echo ${#VAR}              # 11

# Substring extraction
echo ${VAR:0:5}          # Hello (start at 0, length 5)
echo ${VAR:6}            # World (from position 6 to end)

# String replacement
echo ${VAR/World/Unix}   # Hello Unix (first occurrence)
echo ${VAR//l/L}         # HeLLo WorLd (all occurrences)

# Remove prefix/suffix
FILE="backup.tar.gz"
echo ${FILE%.gz}         # backup.tar (remove .gz)
echo ${FILE%%.*}         # backup (remove longest .*)
echo ${FILE#backup}      # .tar.gz (remove backup)
echo ${FILE##*.}         # gz (remove longest prefix)

# Case conversion (Bash 4+)
echo ${VAR,,}            # hello world (lowercase)
echo ${VAR^^}            # HELLO WORLD (uppercase)
echo ${VAR^}             # Hello World (first letter uppercase)
```

#### Arrays
```bash
# Declare array
ARRAY=("item1" "item2" "item3")

# Or
ARRAY[0]="item1"
ARRAY[1]="item2"
ARRAY[2]="item3"

# Access elements
echo ${ARRAY[0]}         # item1
echo ${ARRAY[@]}         # All elements
echo ${ARRAY[*]}         # All elements as one string

# Array length
echo ${#ARRAY[@]}        # Number of elements

# Iterate over array
for item in "${ARRAY[@]}"; do
    echo $item
done

# Add to array
ARRAY+=("item4")

# Associative arrays (Bash 4+)
declare -A ASSOC_ARRAY
ASSOC_ARRAY["key1"]="value1"
ASSOC_ARRAY["key2"]="value2"
echo ${ASSOC_ARRAY["key1"]}
```

### Quoting

Understanding quoting is crucial for avoiding bugs.

#### Single Quotes (`'`)
Everything is literal, no expansion.

```bash
VAR="value"
echo '$VAR'              # Output: $VAR (not expanded)
echo 'Hello $USER'       # Output: Hello $USER
```

#### Double Quotes (`"`)
Variables and command substitution are expanded.

```bash
VAR="value"
echo "$VAR"              # Output: value (expanded)
echo "Hello $USER"       # Output: Hello john (expanded)

# Preserve spaces
echo "Hello    World"    # Output: Hello    World (spaces preserved)
```

#### No Quotes
Word splitting occurs, variables expanded.

```bash
VAR="Hello World"
echo $VAR                # Output: Hello World (but word splitting can occur)

# Problem with spaces
FILES="file1 file2 file3"
for file in $FILES; do   # Loops 3 times (good)
    echo $file
done

# But this can break:
FILES="file with spaces.txt"
for file in $FILES; do   # Loops 3 times (bad!)
    echo $file
done

# Solution: use quotes
for file in "$FILES"; do  # Loops once (correct)
    echo $file
done
```

#### Command Substitution
```bash
# Backticks (older style)
DATE=`date`
echo $DATE

# $() (preferred, more readable, supports nesting)
DATE=$(date)
echo $DATE

# Nested command substitution
echo "Today is $(date +%A), $(date +%B) $(date +%d)"

# In double quotes
echo "Current directory: $(pwd)"

# In assignments
FILES=$(ls)
COUNT=$(ls | wc -l)
```

---

## 3. Conditionals

### if/else Statements

#### Basic Syntax
```bash
if [ condition ]; then
    commands
fi

# With else
if [ condition ]; then
    commands
else
    other_commands
fi

# With elif
if [ condition1 ]; then
    commands1
elif [ condition2 ]; then
    commands2
else
    other_commands
fi
```

#### Test Commands

**`test` command:**
```bash
if test -f file.txt; then
    echo "File exists"
fi
```

**`[ ]` brackets (same as test):**
```bash
if [ -f file.txt ]; then
    echo "File exists"
fi

# Note: spaces are required around brackets
```

**`[[ ]]` double brackets (Bash extension, more features):**
```bash
if [[ -f file.txt ]]; then
    echo "File exists"
fi

# Supports pattern matching and regex
if [[ $VAR == *.txt ]]; then
    echo "Ends with .txt"
fi
```

#### File Tests
```bash
# File existence and type
[ -f file ]      # File exists and is regular file
[ -d dir ]       # Directory exists
[ -e path ]      # File/directory exists
[ -L file ]      # Symbolic link exists
[ -b file ]      # Block device
[ -c file ]      # Character device

# File permissions
[ -r file ]      # Readable
[ -w file ]      # Writable
[ -x file ]      # Executable

# File properties
[ -s file ]      # File exists and is not empty
[ -N file ]      # File modified since last read
[ -O file ]      # Owned by effective user
[ -G file ]      # Owned by effective group

# Comparison
[ file1 -nt file2 ]  # file1 newer than file2
[ file1 -ot file2 ]  # file1 older than file2
[ file1 -ef file2 ]  # Same file (hard links)

# Examples
if [ -f /etc/passwd ]; then
    echo "Password file exists"
fi

if [ -d /var/log ]; then
    echo "Log directory exists"
fi

if [ -r config.txt ] && [ -w config.txt ]; then
    echo "Config file is readable and writable"
fi
```

#### String Tests
```bash
# String comparison
[ -z "$VAR" ]        # String is empty (zero length)
[ -n "$VAR" ]        # String is not empty
[ "$VAR" = "value" ] # Strings are equal
[ "$VAR" != "value" ] # Strings are not equal
[ "$VAR" < "value" ] # String less than (ASCII)
[ "$VAR" > "value" ] # String greater than (ASCII)

# Pattern matching (with [[ ]])
[[ $VAR == pattern ]]      # Pattern match
[[ $VAR =~ regex ]]        # Regular expression match

# Examples
if [ -z "$USERNAME" ]; then
    echo "Username is not set"
fi

if [ "$USER" = "root" ]; then
    echo "Running as root"
fi

if [[ "$FILE" == *.txt ]]; then
    echo "Text file"
fi

if [[ "$EMAIL" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
    echo "Valid email"
fi
```

#### Numeric Tests
```bash
# Numeric comparison
[ $NUM -eq 10 ]  # Equal
[ $NUM -ne 10 ]  # Not equal
[ $NUM -lt 10 ]  # Less than
[ $NUM -le 10 ]  # Less than or equal
[ $NUM -gt 10 ]  # Greater than
[ $NUM -ge 10 ]  # Greater than or equal

# Examples
COUNT=5
if [ $COUNT -gt 10 ]; then
    echo "Count is greater than 10"
elif [ $COUNT -eq 5 ]; then
    echo "Count is exactly 5"
else
    echo "Count is less than 5"
fi
```

#### Logical Operators
```bash
# AND
[ condition1 ] && [ condition2 ]
[[ condition1 && condition2 ]]  # In double brackets

# OR
[ condition1 ] || [ condition2 ]
[[ condition1 || condition2 ]]  # In double brackets

# NOT
[ ! condition ]

# Examples
if [ -f file.txt ] && [ -r file.txt ]; then
    echo "File exists and is readable"
fi

if [ "$USER" = "root" ] || [ "$USER" = "admin" ]; then
    echo "Admin user"
fi

if [ ! -d /nonexistent ]; then
    echo "Directory does not exist"
fi
```

#### Case Statements
Useful for multiple conditions.

```bash
case $VARIABLE in
    pattern1)
        commands1
        ;;
    pattern2)
        commands2
        ;;
    *)
        default_commands
        ;;
esac

# Example
case $1 in
    start)
        echo "Starting service"
        ;;
    stop)
        echo "Stopping service"
        ;;
    restart)
        echo "Restarting service"
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

# Pattern matching
case $FILE in
    *.txt)
        echo "Text file"
        ;;
    *.jpg|*.png)
        echo "Image file"
        ;;
    *)
        echo "Unknown file type"
        ;;
esac
```

---

## 4. Loops

### for Loops

#### Iterating Over Lists
```bash
# Basic syntax
for item in list; do
    commands
done

# Example
for fruit in apple banana orange; do
    echo "Fruit: $fruit"
done

# Iterate over files
for file in *.txt; do
    echo "Processing: $file"
done

# Iterate over command output
for user in $(cat /etc/passwd | cut -d: -f1); do
    echo "User: $user"
done
```

#### C-Style for Loops
```bash
for ((i=1; i<=10; i++)); do
    echo "Number: $i"
done

# Countdown
for ((i=10; i>=1; i--)); do
    echo $i
done

# Step by 2
for ((i=0; i<=10; i+=2)); do
    echo $i
done
```

#### Iterating Over Arrays
```bash
ARRAY=("item1" "item2" "item3")

for item in "${ARRAY[@]}"; do
    echo $item
done

# With index
for i in "${!ARRAY[@]}"; do
    echo "Index $i: ${ARRAY[$i]}"
done
```

#### Iterating Over Arguments
```bash
for arg in "$@"; do
    echo "Argument: $arg"
done

# Or simply
for arg; do
    echo "Argument: $arg"
done
```

### while Loops

```bash
# Basic syntax
while [ condition ]; do
    commands
done

# Example: Count to 10
COUNT=1
while [ $COUNT -le 10 ]; do
    echo $COUNT
    COUNT=$((COUNT + 1))
done

# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < file.txt

# Infinite loop (with break condition)
while true; do
    echo "Running..."
    sleep 1
    # Break condition would go here
done

# Read user input
while true; do
    read -p "Enter command (quit to exit): " cmd
    if [ "$cmd" = "quit" ]; then
        break
    fi
    echo "You entered: $cmd"
done
```

### until Loops

Reverse of while - continues until condition is true.

```bash
# Basic syntax
until [ condition ]; do
    commands
done

# Example: Wait for service
until systemctl is-active myservice; do
    echo "Waiting for service..."
    sleep 1
done
echo "Service is active!"
```

### Loop Control

#### `break` - Exit Loop
```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        break  # Exit loop
    fi
    echo $i
done
# Output: 1 2 3 4

# Break from nested loop
for i in {1..3}; do
    for j in {1..3}; do
        if [ $j -eq 2 ]; then
            break 2  # Break from both loops
        fi
        echo "$i-$j"
    done
done
```

#### `continue` - Skip Iteration
```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        continue  # Skip this iteration
    fi
    echo $i
done
# Output: 1 2 3 4 6 7 8 9 10
```

---

## 5. Functions

### Function Definition

#### Basic Syntax
```bash
# Method 1: With function keyword
function my_function() {
    commands
}

# Method 2: Without function keyword (more portable)
my_function() {
    commands
}

# Example
greet() {
    echo "Hello, $1!"
}

greet "World"  # Output: Hello, World!
```

#### Function Parameters
```bash
# Functions use positional parameters ($1, $2, etc.)
add() {
    local sum=$(( $1 + $2 ))
    echo $sum
}

result=$(add 5 3)
echo "Sum: $result"  # Output: Sum: 8

# Function with multiple parameters
create_user() {
    local username=$1
    local home_dir=$2
    local shell=${3:-/bin/bash}  # Default shell
    
    echo "Creating user: $username"
    echo "Home: $home_dir"
    echo "Shell: $shell"
}

create_user "john" "/home/john"
```

#### Return Values
```bash
# Functions return exit status (0 = success, non-zero = error)
check_file() {
    if [ -f "$1" ]; then
        return 0  # Success
    else
        return 1  # Failure
    fi
}

if check_file "test.txt"; then
    echo "File exists"
else
    echo "File does not exist"
fi

# Return data via echo (capture with $())
get_hostname() {
    echo $(hostname)
}

HOST=$(get_hostname)
echo "Hostname: $HOST"
```

#### Local Variables
```bash
# Variables in functions are global by default
my_function() {
    VAR="value"  # Global variable
}

# Use local to make variable local
my_function() {
    local VAR="value"  # Local to function
    echo $VAR
}

# Example
counter() {
    local count=0
    count=$((count + 1))
    echo "Count: $count"
}

counter  # Output: Count: 1
counter  # Output: Count: 1 (not 2, because local)
```

#### Function Best Practices
```bash
# Good function example
backup_file() {
    local source_file=$1
    local backup_dir=${2:-/backup}
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_file="${backup_dir}/${source_file}.${timestamp}"
    
    if [ ! -f "$source_file" ]; then
        echo "Error: Source file not found: $source_file" >&2
        return 1
    fi
    
    if [ ! -d "$backup_dir" ]; then
        mkdir -p "$backup_dir" || {
            echo "Error: Cannot create backup directory" >&2
            return 1
        }
    fi
    
    cp "$source_file" "$backup_file" && {
        echo "Backup created: $backup_file"
        return 0
    } || {
        echo "Error: Backup failed" >&2
        return 1
    }
}

# Usage
backup_file "/etc/ssh/sshd_config" "/backup/ssh"
```

---

## 6. Error Handling

### Exit Codes

Every command returns an exit code:
- `0` = Success
- Non-zero = Error (usually 1-255)

```bash
# Check exit code
command
echo $?  # 0 if success, non-zero if error

# Use exit code in conditionals
if command; then
    echo "Success"
else
    echo "Failed"
fi
```

### Error Handling Techniques

#### `set -e` - Exit on Error
```bash
#!/bin/bash
set -e  # Exit immediately if a command exits with non-zero status

# Script will exit if any command fails
command_that_might_fail
echo "This won't run if above command fails"
```

#### `set -u` - Exit on Undefined Variable
```bash
#!/bin/bash
set -u  # Exit if undefined variable is used

# This will cause error if VAR is not set
echo $VAR
```

#### `set -o pipefail` - Catch Pipe Failures
```bash
#!/bin/bash
set -o pipefail  # Return value of pipeline is last command to exit with non-zero

# Without pipefail, this might return 0 even if grep fails
command | grep pattern

# With pipefail, it will return non-zero if grep fails
```

#### Combined Error Handling
```bash
#!/bin/bash
set -euo pipefail  # Best practice: all three together

# Or
set -e
set -u
set -o pipefail
```

#### `trap` - Error Trapping
```bash
# Trap errors
trap 'echo "Error on line $LINENO"' ERR

# Cleanup on exit
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/tempfile
}

trap cleanup EXIT

# Trap specific signals
trap 'echo "Interrupted"; exit 1' INT TERM

# Example: Always cleanup
temp_file="/tmp/myscript.$$"
trap "rm -f $temp_file" EXIT

echo "test" > $temp_file
# File will be deleted on exit (normal or error)
```

### Debugging

#### `set -x` - Debug Mode
```bash
#!/bin/bash
set -x  # Print each command before executing

VAR="test"
echo $VAR

# Output:
# + VAR=test
# + echo test
# test
```

#### Conditional Debugging
```bash
#!/bin/bash
# Enable debug if DEBUG is set
[ "${DEBUG:-}" = "1" ] && set -x

# Run with: DEBUG=1 ./script.sh
```

#### Logging
```bash
# Log function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" >> /var/log/myscript.log
}

log "Script started"
log "Processing file: $1"

# Or with different log levels
log_info() {
    echo "[INFO] $*"
}

log_error() {
    echo "[ERROR] $*" >&2
}

log_warn() {
    echo "[WARN] $*" >&2
}
```

---

## 7. Input/Output

### Reading Input

#### `read` Command
```bash
# Read single input
read -p "Enter your name: " name
echo "Hello, $name"

# Read multiple values
read -p "Enter first and last name: " first last
echo "First: $first, Last: $last"

# Read without prompt (silent)
read name

# Read password (hidden)
read -s -p "Enter password: " password
echo

# Read with timeout
read -t 5 -p "Enter value (5 sec timeout): " value

# Read into array
read -a array
echo "First element: ${array[0]}"
```

#### Command-Line Arguments
```bash
#!/bin/bash
# Access arguments
echo "Script: $0"
echo "First arg: ${1:-not provided}"
echo "Second arg: ${2:-not provided}"
echo "All args: $@"

# Shift arguments
shift  # Remove first argument, $2 becomes $1
echo "After shift, first arg: $1"

# Process all arguments
for arg in "$@"; do
    echo "Processing: $arg"
done
```

#### Reading from Files
```bash
# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < file.txt

# Read with line number
line_num=1
while IFS= read -r line; do
    echo "$line_num: $line"
    ((line_num++))
done < file.txt
```

### Output

#### `echo` vs `printf`
```bash
# echo - simple output
echo "Hello World"
echo -n "No newline"  # -n suppresses newline
echo -e "Line1\nLine2"  # -e enables escape sequences

# printf - formatted output (more control)
printf "Name: %s, Age: %d\n" "John" 30
printf "Number: %05d\n" 42  # Output: 00042
printf "Float: %.2f\n" 3.14159  # Output: 3.14
```

#### Redirecting Output
```bash
# Redirect stdout to file (overwrite)
command > file.txt

# Redirect stdout to file (append)
command >> file.txt

# Redirect stderr
command 2> error.log

# Redirect both stdout and stderr
command > output.log 2>&1
command &> output.log  # Shorthand

# Redirect stdout to file, stderr to another
command > output.log 2> error.log

# Discard output
command > /dev/null
command 2> /dev/null
command > /dev/null 2>&1  # Discard all output
```

#### Pipes
```bash
# Pipe stdout to next command
ls -l | grep ".txt"
ps aux | grep "nginx"

# Pipe to multiple commands
command | tee file.txt | grep pattern
```

#### Here Documents
```bash
# Here document
cat << EOF
This is a multi-line
text block that will be
printed to stdout
EOF

# Here document to file
cat > config.txt << EOF
server {
    listen 80;
    server_name example.com;
}
EOF

# Here document with variable expansion
NAME="John"
cat << EOF
Hello, $NAME
Today is $(date)
EOF

# Here document without expansion (literal)
cat << 'EOF'
This $VAR will not be expanded
EOF
```

---

## 8. Advanced Topics

### Regular Expressions

#### `grep` - Pattern Matching
```bash
# Basic grep
grep "pattern" file.txt

# Case insensitive
grep -i "pattern" file.txt

# Show line numbers
grep -n "pattern" file.txt

# Show only matching part
grep -o "pattern" file.txt

# Invert match
grep -v "pattern" file.txt

# Extended regex
grep -E "pattern1|pattern2" file.txt

# Count matches
grep -c "pattern" file.txt

# Recursive search
grep -r "pattern" /path/to/dir
```

#### `sed` - Stream Editor
```bash
# Substitute first occurrence per line
sed 's/old/new/' file.txt

# Substitute all occurrences
sed 's/old/new/g' file.txt

# Substitute with backup
sed -i.bak 's/old/new/g' file.txt

# Delete lines
sed '/pattern/d' file.txt

# Print specific lines
sed -n '10,20p' file.txt  # Lines 10-20

# Multiple commands
sed -e 's/old1/new1/' -e 's/old2/new2/' file.txt
```

#### `awk` - Text Processing
```bash
# Print specific field
awk '{print $1}' file.txt  # First field

# Print with delimiter
awk -F: '{print $1, $3}' /etc/passwd  # Fields 1 and 3

# Conditional printing
awk '$3 > 1000 {print $1}' /etc/passwd

# Built-in variables
awk '{print NR, NF, $0}' file.txt  # Line number, field count, whole line
```

### Process Substitution

```bash
# Input process substitution
diff <(sort file1.txt) <(sort file2.txt)

# Output process substitution
command > >(tee output.log | grep error)

# Example: Compare sorted outputs
comm <(sort file1) <(sort file2)
```

### Background Jobs

```bash
# Run command in background
command &

# Run multiple commands in background
command1 &
command2 &
command3 &
wait  # Wait for all background jobs

# Run command in background and detach
nohup command > output.log 2>&1 &

# Check background jobs
jobs

# Bring to foreground
fg %1

# Send to background
bg %1
```

---

## Complete Script Examples

### Example 1: System Information Script
```bash
#!/bin/bash
# system_info.sh - Display system information

set -euo pipefail

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Users logged in: $(who | wc -l)"
echo "Disk usage:"
df -h | grep -E '^/dev/'
echo "Memory usage:"
free -h
```

### Example 2: Backup Script
```bash
#!/bin/bash
# backup.sh - Backup files with timestamp

set -euo pipefail

SOURCE_DIR=${1:-$HOME}
BACKUP_DIR=${2:-/backup}
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "${BACKUP_DIR}/${BACKUP_NAME}" "$SOURCE_DIR"

echo "Backup created: ${BACKUP_DIR}/${BACKUP_NAME}"
echo "Size: $(du -h "${BACKUP_DIR}/${BACKUP_NAME}" | cut -f1)"
```

### Example 3: User Management Script
```bash
#!/bin/bash
# create_user.sh - Create user with validation

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <username> [home_directory] [shell]"
    exit 1
fi

USERNAME=$1
HOME_DIR=${2:-/home/$USERNAME}
SHELL=${3:-/bin/bash}

# Check if user exists
if id "$USERNAME" &>/dev/null; then
    echo "Error: User $USERNAME already exists"
    exit 1
fi

# Create user
sudo useradd -m -d "$HOME_DIR" -s "$SHELL" "$USERNAME"

# Set password
sudo passwd "$USERNAME"

echo "User $USERNAME created successfully"
echo "Home directory: $HOME_DIR"
echo "Shell: $SHELL"
```

### Example 4: Log Monitoring Script
```bash
#!/bin/bash
# monitor_logs.sh - Monitor log files for errors

set -euo pipefail

LOG_FILE=${1:-/var/log/syslog}
KEYWORD=${2:-error}

echo "Monitoring $LOG_FILE for '$KEYWORD'..."
echo "Press Ctrl+C to stop"
echo ""

tail -f "$LOG_FILE" | while IFS= read -r line; do
    if echo "$line" | grep -qi "$KEYWORD"; then
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] $line"
    fi
done
```

---

## Scripting Best Practices Summary

1. **Always use shebang**: `#!/bin/bash`
2. **Set error handling**: `set -euo pipefail`
3. **Use meaningful variable names**: `USER_NAME` not `X`
4. **Quote variables**: `"$VAR"` not `$VAR`
5. **Add comments**: Explain complex logic
6. **Validate input**: Check arguments and files
7. **Use functions**: Break code into reusable pieces
8. **Handle errors gracefully**: Provide meaningful messages
9. **Use local variables**: In functions, use `local`
10. **Test scripts**: Test with various inputs
11. **Follow style guide**: Consistent formatting
12. **Document usage**: Include usage examples

---

## Notes

Document your learnings here:
- Script examples you've created
- Useful snippets and patterns
- Common mistakes and solutions
- Debugging techniques
- Best practices discovered
- Troubleshooting tips

---

**Next Topic:** [System Configuration](../03-system-configuration/)
