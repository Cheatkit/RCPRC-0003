#!/bin/bash

# Define a function to display the menu
function display_menu {
  echo "Select an option:"
  echo "1. Ping a host"
  echo "2. List files"
  echo "3. Delete directory and files in it"
  echo "4. Create and Edit File"
  echo "5. Search for file via search term"
  echo "6. Copy files to destination"
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

  # prompt the user to choose options
  read -p "Enter your option:  List everything 'A' | List files after size: " option_list
  # function to list files
  ls
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


# Define a function to create file 
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

# Define a function to search_file
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

function exit_back {
  read -s -N 1 key
  if [[ "$key" == $'\e' ]]; then
    echo "Returning to main menu..."
    return 0
  fi
}




# Display the menu and prompt the user for input
while true; do
  display_menu
  read -p "Enter your choice (or type ':exit' to return to the main menu): " choice

  # Check if the user wants to exit to the main menu
  if [[ "$choice" == ":exit" ]]; then
    continue
  fi

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
    # Call function search_files
      search_files
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
