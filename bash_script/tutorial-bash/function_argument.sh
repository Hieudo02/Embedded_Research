#!/bin/bash

show_name(){
	echo hello $1
	if [ ${1,,} = hieu ]; then
		return 0
	else
		return 1
	fi
}

show_name $1

if [ $? = 1 ]; then
	echo "Someone unknown called the function!"
fi
