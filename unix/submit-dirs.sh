#!/bin/bash
echo "Creating directories needed..." 
if [ $# -ne 1 ]; then
    echo "The classlist argument should be present";
else 
    if [ -f $1 ]; then
        if [ ! -d submit ]; then
	  mkdir "submit";
	  echo "Directory submit didn't exist, the directory was created.";
	fi
	classlist=`less $1`
	for alumn in $classlist; do
	    alumnDirectory="submit/$alumn"
	    if [ ! -d $alumnDirectory  ]; then
	    	mkdir $alumnDirectory
		echo "Directory $alumnDirectory was created"
	    fi
	done
    else
        echo "The file of the classlist should exist."
    fi
fi
echo "done."
