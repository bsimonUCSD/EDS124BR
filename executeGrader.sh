#!/bin/bash

cd /grader

SEQUENCING="ZZDS0"
REPEATS="orhVX"
NESTEDREPEATS="vhlGt"
EVENTS="24JIA"
VARIABLES="HKPZS"
CONDITIONALLOOPS="s865q"
IFELSE="GK5BO"
NESTEDIFELSE="tLwYI"
COMPOUNDCONDITIONALS="LnAAt"
ABSTRACTION="7bpaR"
LISTS="dIMK2"

while [[ $# > 1 ]] 
do 
    key="$1"
    case $key in 
        partId)
            PARTID="$2"
            shift
            ;;
        filename)
            ORIGINAL_FILENAME="$2"
            shift
            ;;
        esac
    shift
done

if [ "$PARTID" == "$SEQUENCING" ]; then 
    KEYWORD="WP_Sequencing"
elif [ "$PARTID" == "$REPEATS" ]; then
    KEYWORD="WP_Repeats"
elif [ "$PARTID" == "$NESTEDREPEATS" ]; then
    KEYWORD="WP_NestedRepeats"
elif [ "$PARTID" == "$EVENTS" ]; then
    KEYWORD="WP_Events1"
elif [ "$PARTID" == "$VARIABLES" ]; then
    KEYWORD="WP_Variables"
elif [ "$PARTID" == "$CONDITIONALLOOPS" ]; then
    KEYWORD="WP_ConditionalLoops"
elif [ "$PARTID" == "$IFELSE" ]; then
    KEYWORD="WP_IfElse1"
elif [ "$PARTID" == "$NESTEDIFELSE" ]; then
    KEYWORD="WP_NestedIfElse"
elif [ "$PARTID" == "$COMPOUNDCONDITIONALS" ]; then
    KEYWORD="WP_CompoundConditionals1"
elif [ "$PARTID" == "$ABSTRACTION" ]; then
    KEYWORD="WP_Abstraction1"
elif [ "$PARTID" == "$LISTS" ]; then
    KEYWORD="WP_Lists"
else   
    echo "{ \"fractionalScore\":0.0, \"feedback\":\"Assignment not found. Contact instructor.\" }"
    exit
fi

./eval.sh $KEYWORD
