#!/bin/bash

if [ $# -lt 1 ]
then
  echo "Usage: `basename $0` PORT [PROCESS]
	Find any processes listening on PORT and kill then with optional process filter PROCESS"
	exit
fi

if [ $# -eq 1 ]
then
	lsof -i :$1 | awk 'NR > 1 { print $2 }' | xargs -r kill
else
	lsof -i :$1 | grep $2 | awk '{ print $2 }' | xargs -r kill
fi
