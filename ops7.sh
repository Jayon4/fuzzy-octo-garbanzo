#!/bin/bash
# Take care to only perform this operation in user-created directories. Changing permissions in system files/directories is not advised, as this can cause malfunctions in the OS.

# Create a new bash script that performs the following:

# Prompts user for input directory path or file.
# Prompts user for input permissions number (e.g. 777 to perform a chmod 777, 775, 664)
# Navigates to the directory input by the user and changes all files inside it to the input setting.
# Prints to the screen the directory contents and the new permissions settings of everything in the directory or file you selected.

#!/bin/bash

# Get the file or directory path
read -p "Enter the file or directory path: " target_path

# Get the permission number
read -p "Enter the permission number (e.g., 777): " permission

# Change permissions and show results
chmod -R "$permission" "$target_path"
ls -l "$target_path"

echo "Permissions updated!"

