#!/bin/bash

input="/home/raj/spider_task1/usernames.csv"

while IFS=',' read -r username group permission
do
    if ! getent group "$group" > /dev/null; then
        echo "Group $group does not exist. Creating group $group."
        sudo groupadd "$group"
    fi

    if ! getent passwd "$username" > /dev/null; then
        echo "User $username does not exist. Creating user $username."
        sudo useradd -g "$group" -m "$username"
        if [ $? -ne 0 ]; then
            echo "Failed to create user: $username"
            continue
        fi
        echo "$username:q1@w2@e3@r4@t5@" |sudo chpasswd
        if [ $? -ne 0 ]; then
            echo "Failed to set password for user: $username"
            continue
        fi
    fi
    home_dir="/home/$username"

    if [ ! -d "$home_dir" ]; then
        echo "Home directory '$home_dir' not found. Creating home directory."
        sudo mkdir -p "$home_dir"
        if [ $? -ne 0 ]; then
            echo "Failed to create home directory: $home_dir"
            continue
        fi
    fi

    echo "Setting ownership and permissions for $home_dir"
    sudo chown "$username:$group" "$home_dir"
    sudo chmod "$permission" "$home_dir"

    projects_dir="$home_dir/projects"
    if [ ! -d "$projects_dir" ]; then
        echo "Creating projects directory at $projects_dir"
        sudo mkdir "$projects_dir"
    fi
    sudo echo "Welcome, $username! This is your official account of the Spider R&D club." > $projects_dir/README.md
    sudo chown -R "$username:$group" "$projects_dir"

    echo "Created user: $username with group: $group and permissions: $permission"
    echo "Created projects directory and README.md for user: $username"

done < "$input"
