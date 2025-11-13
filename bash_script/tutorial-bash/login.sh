#!/bin/bash

case ${1,,} in 
	hieu | admin)
		echo "Hello, you're the boss here!"
		;;
	help)
		echo "Just type your username!"
		;;
	*)
		echo "Hi there. You're not the boss of me, please enter a valid username!"
esac
