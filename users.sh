# check the user is present or not, If not create a user 
# Create random password with special characters
# Force the user to reset the password during first time login
#input should be sh users.sh user testuser (You can add multiple users)


#!/bin/bash
if [ $# -gt 0 ]; then
    for USER in $@; do
        echo $USER
        if [[ $USER =~ ^[a-zA-Z]+$ ]]; then
            EXISTING_USER= $(cat /etc/passwd | grep -iw $USER | cut -d ":" f1)
            if [ "${USER}" = "${EXISTING_USER}" ]; then
                echo "The $USER is Present"
            else
                echo "Lets creates a new user $USER"
                sudo useradd -m $USER --shell /bin/bash
                SPEC= $(echo '@£$%^&*()' | fold -w1 | shuf | head -1)
                PASSWORD= "Password@${RANDOM}${SPEC}"
                echo "$USER:$PASSWORD" | sudo chpasswd 
                echo "The temporary password is the $USER is ${PASSWORD}"
                passwd -e $USER
            fi
        else
            echo "Given User is not valid, Because it contains number and it must contains alphabet"
        fi
    done
else
    echo "Please enter the valid parameter"
fi
