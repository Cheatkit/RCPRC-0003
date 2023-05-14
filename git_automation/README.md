# Git Automation Script

The Git Automation Script is a shell script that provides a menu-driven interface to automate various Git operations. It simplifies the process of managing multiple repositories and deploying changes by offering several options.

## Features

The script provides the following features:

1. **Create Repository:** Create a new Git repository by specifying the repository name.
2. **Clone Repository:** Clone an existing Git repository by providing the repository URL.
3. **Update Repository:** Update an existing Git repository by pulling the latest changes from the remote repository.
4. **Change Git Profile Information:** Update the global Git configuration with your username and email.
5. **Stage Changes:** Stage all changes in the current repository to prepare for committing.
6. **Add VSCode to Linux:** Install Visual Studio Code (VSCode) on a Linux system using the Snap package manager.
7. **Push Local Repository to Remote:** Push the changes from a local repository to a remote repository.
8. **Generate SSH Key and Add to Git Profile:** Generate an SSH key pair and add it to the Git profile for secure authentication.

## Requirements

The script requires the following dependencies to be installed:

- Git: The script relies on Git for repository management and operations.
- Bash Shell: The script is written in Bash and requires a compatible shell environment.

## Usage

To use the Git Automation Script, follow these steps:

1. Ensure that the script file `git_automation.sh` has executable permissions. If not, grant the necessary permissions using the command: 
        
        chmod +x git_automation.sh
3. Run the script in your preferred shell by executing the command: 
        
        ./git_automation.sh
5. The script will present a menu with several options. Enter the corresponding number to perform the desired action.
6. Follow the prompts and provide the required information as requested by the script.
7. Once the operation is completed, you will see appropriate success messages.

## Notes

- Make sure you have Git installed and accessible from the command line for the script to work properly.
- It is advisable to review the source code of the script and modify it according to your specific needs or security considerations.
- This script is intended for Unix-like systems, such as Linux or macOS, but may also work on other platforms with appropriate shell environments.

## License

The Git Automation Script is open-source software released under the [GNU Affero General Public License v3.0](https://github.com/RCPRC/.github/blob/main/LICENSE). Feel free to modify and distribute it as per the terms of the license.

## Disclaimer

This script is provided as-is without any warranty. The authors and contributors of the script are not responsible for any consequences resulting from its usage. Use it at your own risk.

## Contributions

Contributions to the Git Automation Script are welcome! If you find any issues or have ideas for improvements, please open an issue or submit a pull request on the [GitHub repository](https://github.com/RCPRC/RCPRC-0003)

---

&copy; CastouloLee 2023
