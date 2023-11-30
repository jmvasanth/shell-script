#! /bin/bash

#Install all the packages received as an input 

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user"
    exit 1
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE $N"
    else
        echo -e "$2 .... $G SUCCESS $N"
    fi
}

for i in $@
do
    if rpm -q $i &> /dev/null
    then
        echo -e "$Y $i package is already installed $N"
    exit 1
    else
    yum install $i -y &>>$LOGFILE
    VALIDATE $? "Installing $i"
    fi
done