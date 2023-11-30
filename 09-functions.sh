#! /bin/bash

# Script to install mysql and postfix

USERID=$(id -u)

#This functions will validate the previous command
VALIDATE (){
    if [ $1 ne 0 ]
    then
        echo "$2 .... FAILURE"
    else
        echo "$2 .... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

yum install mysql -y

VALIDATE $? "Installing mysql"

yum install postfix -y

VALIDATE $? "Installing postfix"