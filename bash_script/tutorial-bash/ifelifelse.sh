#!/bin/bash

if [ ${1,,} = hieu ]; then
	echo "Oh, Hi Hieu!"
elif [ ${1,,} = help ]; then
	echo "Just type your username, duh!"
else
	echo "Who are you? F**k off!"
fi
