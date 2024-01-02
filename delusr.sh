#!/bin/bash

read -p "Please enter the name of user to remove: " usrname

id $usrname &> /dev/null

if [ $? == 0 ]
then
	sudo deluser $usrname && sudo rm -rf /home/$usrname && sudo groupdel $usrname
	echo "User $usrname has been purged from the system..."
else
	echo "User $usrname does not exist!"
	exit 0
fi
