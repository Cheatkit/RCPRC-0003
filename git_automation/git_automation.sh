#!/bin/bash

create_repository() {
    read -p "Enter a repository name: " repo_name
    mkdir "$repo_name"
    cd "$repo_name" || exit
    git init
    echo "Created repository '$repo_name'."
}

clone_repository() {
    read -p "Enter a repository URL: " repo_url
    git clone "$repo_url"
    repo_name=$(basename "$repo_url" .git)
    echo "Cloned repository '$repo_name'."
}

update_repository() {
    read -p "Enter the repository path: " repo_path
    cd "$repo_path" || exit
    git pull
    echo "Updated repository '$repo_path'."
}

change_git_profile() {
    read -p "Enter your Git username: " username
    read -p "Enter your Git email: " email
    git config --global user.name "$username"
    git config --global user.email "$email"
    echo "Git profile information updated."
}

stage_changes() {
    git add .
    echo "Changes staged."
}

add_vscode_to_linux() {
    echo "Installing VSCode..."
    sudo snap install code --classic
    echo "VSCode installation complete."
}

push_local_repository() {
    read -p "Enter the repository path: " repo_path
    cd "$repo_path" || exit
    read -p "Enter the remote name (e.g., origin): " remote_name
    read -p "Enter the branch name (e.g., main): " branch_name
    git push "$remote_name" "$branch_name"
    echo "Local repository pushed to remote."
}

generate_ssh_key() {
    read -p "Enter your email: " email
    ssh-keygen -t rsa -b 4096 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "SSH key generated and added to the Git profile."
}

print_menu() {
    echo "Menu:"
    echo "1. Create Repository"
    echo "2. Clone Repository"
    echo "3. Update Repository"
    echo "4. Change Git Profile information"
    echo "5. Stage Changes"
    echo "6. Add VSCode to Linux"
    echo "7. Push Local Repository to Remote"
    echo "8. Generate SSH key and add to Git Profile"
    echo "9. Exit"
}

# Main script
while true; do
    clear
    print_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) create_repository ;;
        2) clone_repository ;;
        3) update_repository ;;
        4) change_git_profile ;;
        5) stage_changes ;;
        6) add_vscode_to_linux ;;
        7) push_local_repository ;;
        8) generate_ssh_key ;;
        9) exit ;;
        *) echo "Invalid choice. Please enter a valid option."
    esac

    read -p "Press Enter to continue..."
done
