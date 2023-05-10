# Bash Script Menu

This is a Bash script that presents a menu with several options for the user to choose from. The options are:

1. Ping a host
2. List files
3. Delete directory and files in it
4. Create and Edit File
5. Exit

## Usage

To use this script, simply run it in a Bash terminal. The script will display a menu of options and prompt the user to select one. Depending on the option selected, the script will perform a different action.

### Option 1: Ping a host

Selecting option 1 will prompt the user to enter a hostname or IP address to ping. The script will then use the `ping` command to send 4 ICMP packets to the specified host and display the results.

### Option 2: List files

Selecting option 2 will prompt the user to enter the path to a directory or file. The script will then use the `rm` command with the `-rf` option to delete the directory and all files in it.

### Option 3: Delete directory and files in it

Selecting option 3 will prompt the user to enter the path to a directory or file. The script will then use the `rm` command with the `-rf` option to delete the directory and all files in it.

### Option 4: Create and Edit File

Selecting option 4 will prompt the user to enter the path where they want to create the file. The script will check if the directory path exists and create it if it doesn't. Then, the user will be prompted to enter the name of the file they want to create. The script will create the file using the `nano` text editor.

### Option 5: Exit

Selecting option 5 will exit the script.

## Conclusion

This Bash script provides a simple menu of options for the user to perform different actions. It can be useful for automating repetitive tasks or simplifying complex tasks.
