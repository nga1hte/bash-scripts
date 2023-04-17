#!/bin/bash
######################################
###Password Generator using OpenSSL###
######################################

LENGTH=10
PASS=5

printDash() {
	for i in {1..72}
	do
		echo -n "-"
	done
	echo ""
}

generatePassword() {
	echo "------------------------------PASSWORDS---------------------------------"
	printDash

	for p in $(seq 1 $PASS)
	do
		echo -n "pass$p:   " 
		openssl rand -base64 48 | cut -c1-$LENGTH
	done
	printDash
}

while getopts n:p: option
do
	case "${option}"
		in
		n)LENGTH=${OPTARG};;
		p)PASS=${OPTARG};;
		*) echo "Usage: $0 or $0 -n [length for password, default=10] -p [number of passwords, default=5]"
		exit 1
	esac
done

generatePassword
		


