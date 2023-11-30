#! /bin/bash

# Script to install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

yum install mysql -y

if [ $? ne 0 ]
then
    ech0 "Error in installing mysql"
else
    echo "Successfully installed mysql"
fi