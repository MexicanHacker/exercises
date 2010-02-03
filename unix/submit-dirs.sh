############################################
# This exercise is the exersice number 13 from 
# http://www.cs.grinnell.edu/~walker/courses/161.sp09/labs/lab-bash-scripts.shtml#bashscripts-C
#

#!/bin/bash
echo "Creating directories needed..." 
if [ $# -ne 1 ]; then
    echo "The classlist argument should be present";
    exit;
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
	echo "done";
    else
        echo "The file of the classlist should exist."
	exit;
    fi
fi
