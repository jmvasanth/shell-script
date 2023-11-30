#! /bin/bash

# Script to install mysql and postfix
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

#This functions will validate the previous command
VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE $N"
    else
        echo -e "$2 .... $G SUCCESS $N"
    fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing mysql"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing possdtfix"