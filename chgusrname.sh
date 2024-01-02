#!/bin/bash


read -p "Please enter old username: " oldusr
id $oldusr &> /dev/null

if [ $? == 0 ]
then
	read -p "Please enter new username: " newusr
	sudo usermod -l $newusr $oldusr && sudo mv /home/$oldusr /home/$newusr && sudo groupmod -n $newusr $oldusr
	if [ $? == 0 ]
	then
		echo "Old username $oldusr changed to New username $newusr..."
	else
		echo "Error during username change!"
	exit 1
	fi
else
	echo "User does not exist!"
	exit 1
fi
