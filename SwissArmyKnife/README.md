

# Bash Script Menu

This is a Bash script that presents a menu with several options for the user to choose from. The options are:

1. Ping a host
2. List files
3. Delete directory and files in it
4. Create and edit file
5. Search for file
6. Copy file
7. Add permissions for file
8. Change password
9. Change network settings
10. Exit

## Usage

To use this script, simply run it in a Bash terminal. The script will display a menu of options and prompt the user to select one. Depending on the option selected, the script will perform a different action.

### Option 1: Ping a host

Selecting option 1 will prompt the user to enter a hostname or IP address to ping. The script will then use the `ping` command to send 4 ICMP packets to the specified host and display the results. This can be useful for checking if a host is online or to diagnose network connectivity issues.

### Option 2: List files

Selecting option 2 will prompt the user to enter the path to a directory or file. The script will then use the `ls` command to list all files and directories in the specified location. This can be useful for finding specific files or to get an overview of the files in a directory.

### Option 3: Delete directory and files in it

Selecting option 3 will prompt the user to enter the path to a directory or file. The script will then use the `rm` command with the `-rf` option to delete the directory and all files in it. This can be useful for cleaning up a directory or for deleting unnecessary files.

### Option 4: Create and Edit File

Selecting option 4 will prompt the user to enter the path where they want to create the file. The script will check if the directory path exists and create it if it doesn't. Then, the user will be prompted to enter the name of the file they want to create. The script will create the file using the `nano` text editor, which allows the user to create and edit text files. This can be useful for creating or modifying configuration files or scripts.

### Option 5: Search for file

Selecting option 5 will prompt the user to enter the name of the file they want to search for. The script will then use the `find` command to search for the file in the current directory and all subdirectories. This can be useful for finding specific files that are located somewhere in a directory hierarchy.

### Option 6: Copy file

Selecting option 6 will prompt the user to enter the path of the file they want to copy and the path of the destination where they want to copy the file. The script will then use the `cp` command to copy the file to the specified destination. This can be useful for backing up or moving files to a different location.

### Option 7: Add permissions for file

Selecting option 7 will prompt the user to enter the path of the file they want to modify permissions for, and the new permissions they want to add. The script will then use the `chmod` command to modify the permissions of the specified file. This can be useful for controlling access to files and directories.

### Option 8: Change password

Selecting option 8 will prompt the user to enter their old password and their new password. The script will then use the `passwd` command to change the password for the current user. This can be useful for changing a password if it has been compromised or if the user wants to update their password.

### Option 9: Change network settings

Selecting option 9 will prompt the user to enter a new IP address, netmask, default gateway and dns-server. You will just have to select the option (9) and enter the values you want them to be.

### Option 10: Exit

Selecting option 10 will just terminate the shell script