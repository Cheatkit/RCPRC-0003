#!/bin/bash

#!/bin/bash

# Ask user for the directory path to create
echo "creating new path at /etc/logskeeper..."

# Create directory path
mkdir -p "$dir_path"

# Check if directory path was created successfully
if [ $? -eq 0 ]; then
  echo "Directory path $dir_path created successfully."
else
  echo "Error creating directory path $dir_path."
fi