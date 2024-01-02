#!/bin/bash

read -p "Please enter username: " usrname

id $usrname &> /dev/null

if [ $? != 0 ]
then
	read -p "User does not exist! Do you want to create a new user now:(y/n) " x
	if [ $x == "y" ]
	then
		sudo adduser --home /home/$usrname $usrname
		echo "User $usrname has been successfully created!"
	else
		exit 0
	fi
else
	exit 0
fi

