#!/bin/bash

# Define a function to display the menu
function display_menu {
  echo "Select an option:"
  echo "1. Ping a host"
  echo "2. List files"
  echo "3. Delete directory and files in it"
  echo "4. Create and edit file"
  echo "5. Search for file via search term"
  echo "6. Copy files to destination"
  echo "7. Add permissions for file"
  echo "8. Change password"
  echo "9. Change network settings"
  echo "10. Exit"
}

# Define a function to ping a host (1)
function ping_host {
  read -p "Enter a hostname or IP address to ping: " hostname
  ping -c 4 $hostname

  exit_back
}

# Define a function to list files (2)
function list {
  read -p "Enter your option: List everything 'A' | List files after size 'S' | List directories 'D' | List files/directories after modification date 'T': " option_list
  
  if [[ $option_list == "A" ]]; then
    ls
  elif [[ $option_list == "S" ]]; then
    read -p "List files after size: Enter 'r' for ascending order or 'd' for descending order: " order_list
    if [[ $order_list == "r" ]]; then
      ls -S
    elif [[ $order_list == "d" ]]; then
      ls -rS
    else
      echo "Invalid option."
    fi
  elif [[ $option_list == "D" ]]; then
    ls -d */
  elif [[ $option_list == "T" ]]; then
    ls -lt
  else
    echo "Invalid option."
  fi

  exit_back
}



# Define a function to delete directory (3)
function delete_dir {
  read -p "Enter the path to file/directory to delete (or 'X' to delete entire directory): " path_delete

  if [[ "$path_delete" == "X" ]]; then
    read -p "Are you sure you want to delete the entire directory? (Y/N): " confirm_delete
    
    if [[ "$confirm_delete" == "Y" ]]; then
      rm -rf *
    else
      echo "Deletion cancelled."
    fi
  else
    if [[ -e "$path_delete" ]]; then
      read -p "Are you sure you want to delete this file? (Y/N): " confirm_delete
      if [[ "$confirm_delete" == "Y" ]]; then
        rm "$path_delete"
      else
        echo "Deletion cancelled."
      fi
    else
      echo "File/directory not found."
    fi
  fi

  exit_back
}


# Define a function to delete directory and all files


# Define a function to create file (4)
function create_file {
    read -p "Enter path where you want to create your file: " path_file

    # Check if the directory path exists
    if [ ! -d "$path_file" ]; then
        # Create the directory path if it doesn't exist
        mkdir -p "$path_file"
    fi

    # Change to the directory where the file will be created
    cd "$path_file"

    read -p "Enter name of file: " name_file

    # Create the file using the nano text editor
    nano "$name_file"

    exit_back
}

# Define a function to search_file (5)
function search_files {
  # prompt user to enter search_term and read it immediately
  read -p "Enter search term: " search_term

  # prompt user to enter whether they want to search for a file or a directory
  read -p "Enter 'F' to search for a file or 'D' to search for a directory: " search_type

  # check user input for search type
  if [[ "$search_type" == "F" || "$search_type" == "f" ]]; then
    search_type_arg="f"
    search_type_text="files"
  elif [[ "$search_type" == "D" || "$search_type" == "d" ]]; then
    search_type_arg="d"
    search_type_text="directories"
  else
    echo "Invalid search type."
    return 1
  fi

  # notify user what type of search is being performed
  echo "Searching for $search_type_text with '$search_term' in their names..."

  # search for files or directories based on user input
  find . -iname "*$search_term*" -type "$search_type_arg"

  exit_back
}

# Define a function to copy_files (6)
function copy_files {
    # Prompt user to enter source and destination paths
    read -p "Enter the source path: " source_path
    read -p "Enter the destination path: " dest_path

    # Copy files to destination
    cp "$source_path" "$dest_path"

    exit_back
}

# Define a function to change file permissions (7)
change_permissions() {
    # Prompt user for filename
    read -p "Enter the name of the file/path to the file you want to change permissions for: " filename

    # Prompt user for permission options
    echo "Select new permission options:"
    echo "1. Owner read, write, and execute"
    echo "2. Owner read and write only"
    echo "3. Owner read only"
    echo "4. Custom permission options"
    read -p "Enter your choice: " choice

    # Set permission options based on user's choice
    case "$choice" in
        1) new_permissions="700";;
        2) new_permissions="600";;
        3) new_permissions="400";;
        4) read -p "Enter custom permission options (e.g. 755): " new_permissions;;
        *) echo "Invalid choice. Exiting."; return 1;;
    esac

    # Change file permissions
    chmod "$new_permissions" "$filename"

    # Display confirmation message
    echo "File permissions changed to $new_permissions for $filename."

    exit_back
}

# Define a function to change_password (8)
function change_password {
  read -p "Enter the username whose password you want to change: " username

  # Check if the user exists
  if id "$username" >/dev/null 2>&1; then
    # User exists, prompt for new password
    read -s -p "Enter new password for $username: " new_password
    echo

    # Set the user's new password
    echo "$new_password" | passwd --stdin "$username"

    echo "Password for $username has been changed."
  else
    # User does not exist
    echo "User $username does not exist."
  fi

  exit_back
}

# Defina a function to change_network_settings (9)
function change_network_settings {
  read -p "Enter IP address: " ip_addr
  read -p "Enter subnet mask: " subnet_mask
  read -p "Enter default gateway: " default_gateway
  read -p "Enter DNS server IP: " dns_server

  # Change network settings
  sudo ifconfig eth0 $ip_addr netmask $subnet_mask
  sudo route add default gw $default_gateway
  sudo echo "nameserver $dns_server" > /etc/resolv.conf

  echo "Network settings changed successfully."

  exit_back
}

# Define a function to abort 
function exit_back {
  read -s -p "Press any key to return to main menu. Type ':exit' to exit." key
  if [[ "$key" == $'\e' ]]; then
    echo "Returning to main menu..."
    return 0
    return 0
  elif [[ "$key" == ":exit" ]]; then
    echo "Exiting..."
    return 0
    return 0
  fi
}




# Display the menu and prompt the user for input
while true; do
  display_menu
  read -p "Enter your choice (or type ':exit' to return to the main selection): " choice

  # Check if the user wants to exit to the main menu

  # Check the user's input
  case "$choice" in
    1)
    # Call function ping_host
      ping_host
      ;;
    2)
    # Call function list_files
      list
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
    # Call function search_files
      search_files
      ;;
    6)
    # Call function copy_files
      copy_files
      ;;
    7)
    # Call function change_permissions
      change_permissions
      ;;
    8)
    # Call function change_password
      change_password
      ;;
    9)
    # Call function
      change_network_settings
      ;; 
    10)
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
