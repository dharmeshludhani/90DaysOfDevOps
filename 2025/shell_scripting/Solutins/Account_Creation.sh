#/bin/bash

<<info
In this will create a new user account with the following details:
- Username
- Password
info

echo "==============Creating New user Account===================="


echo "Enter the username for the new account: "
read username
echo "Enter the password for the new account: " 
read password

function create_new_user {

    count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

    if [ $count -eq 0 ]
    then
           sudo useradd -m $username
           echo -e $"password\npassword" | sudo passwd $username
           echo "User account created successfully"
    else
              echo "User account already exists"
    fi 


}

while true;
do 
    create_new_user
    echo "Do you want to create another user account? (y/n)"
    read answer
    if [ $answer == "y" ]
    then
        create_new_user
     else
        echo "Exiting the script"
        break
    fi
done
