#!/bin/bash

# Define a function to display the menu
function display_menu {
  echo "Select an option:"
  echo "1. Ping a host"
  echo "2. List files"
  echo "3. Delete directory and files in it"
  echo "4. Create and Edit File"
  echo "5. Exit"
}

# Define a function to ping a host
function ping_host {
  read -p "Enter a hostname or IP address to ping: " hostname
  ping -c 4 $hostname
}

# Define a function to list files
function list_files {
  read -p "Enter the path to directory/file to delete" path_delete
  rm -rf $path_delete
}

# Define a function to delete directory and all files


# Define a function to create file 
function create_file {
    read -p "Enter path where you want to create your file: " path_file
    cd $path_file
    read -p "Enter name of file: " name_file
    nano $name_file
}

# Display the menu and prompt the user for input
while true; do
  display_menu
  read -p "Enter your choice: " choice

  # Check the user's input
  case "$choice" in
    1)
    # Call function ping_host
      ping_host
      ;;
    2)
    # Call function list_files
      list_files
      ;;
    3)
    # Call function delete_dir
      delete_dir
      ;;
    4)
    # Call function create_file
      create_file
      ;;
    5)
    # Exit the script
      exit 0
      ;;
    *)
      # Display an error message for invalid input
      echo "Invalid choice: $choice"
      ;;
  esac

  # Print a blank line to separate the output from each command
  echo ""
done
