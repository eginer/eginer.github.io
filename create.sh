#!/bin/bash

rst2html --initial-header-level=2 input.rst > output.html
declare -i BODY1
declare -i BODY2
BODY1=$(grep -n body output.html | cut -d ':' -f 1 | head -1)
BODY2=$(grep -n body output.html | cut -d ':' -f 1 | tail -1)

BODY1+=1
BODY2=$BODY2-$BODY1-1

TEXT=$(tail -n +$BODY1 output.html | head -n $BODY2)
rm output.html


declare -i INPUT
declare -i INPUT1
declare -i INPUT2
INPUT1=$(grep -n INPUT index_template | cut -d ':' -f 1 | head -1)
INPUT1+=-1
INPUT2=$INPUT1+2

function output ()
{
head -n +$INPUT1 index_template 
echo $TEXT
tail -n +$INPUT2 index_template 
}

output > index.html


