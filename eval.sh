#!/bin/bash

TEMPKEY=`cat keyFile.txt | grep "$1"`
KEY=${TEMPKEY##*:}

if [ "$1" = "WP_IfElse1" ]; then
    TEMPKEY=`cat keyFile.txt | grep "WP_IfElse2"`
    KEY2=${TEMPKEY##*:}

elif [ "$1" = "WP_CompoundConditionals1" ]; then 
    TEMPKEY=`cat keyFile.txt | grep "WP_CompoundConditionals2"`
    KEY2=${TEMPKEY##*:}

elif [ "$1" = "WP_Abstraction1" ]; then
    TEMPKEY=`cat keyFile.txt | grep "WP_Abstraction2"`
    KEY2=${TEMPKEY##*:}

elif [ "$1" = "WP_Events1" ]; then
    TEMPKEY=`cat keyFile.txt | grep "WP_Events2"`
    KEY2=${TEMPKEY##*:}

    TEMPKEY=`cat keyFile.txt | grep "WP_Events3"`
    KEY3=${TEMPKEY##*:}

    TEMPKEY=`cat keyFile.txt | grep "WP_Events4"`
    KEY4=${TEMPKEY##*:}

    TEMPKEY=`cat keyFile.txt | grep "WP_Events5"`
    KEY5=${TEMPKEY##*:}
fi

cd /shared/submission/
CONTENTS=`ls`
FILE=`cat $CONTENTS`

sed "s/<comment>.*<\/comment> //g" $CONTENTS > /dev/null
sed "s/<comment>.*<\/comment> //g" $CONTENTS > ../../grader/newFile.txt

cd ../../grader
FILE=`cat newFile.txt`

if [ "${FILE/$KEY}" = "${FILE}" ]; then 
    echo "{ \"fractionalScore\": 0.0, \"feedback\":\"Program may have not been built as asked for. Please try looking it over!\" }"
    exit
fi

if [ "$KEY" = "WP_IfElse1" ] || [ "$KEY" = "WP_CompoundConditionals1" ] || [ "$KEY" = "WP_Abstraction1" ] || [ "$KEY" = "WP_Events1" ]; then
    
    if [ "${FILE/$KEY2}" = "${FILE}" ]; then
        echo "{ \"fractionalScore\": 0.0, \"feedback\":\"Program may have not been built as asked for. Please try looking it over!\" }"
        exit
    fi

    if [ "$KEY" = "WP_Events1" ]; then
        if [ "${FILE/$KEY3}" = "${FILE}" ] || [ "${FILE/$KEY4}" = "${FILE}" ] || [ "${FILE/$KEY5}" = "${FILE}" ]; then
            echo "{ \"fractionalScore\": 0.0, \"feedback\":\"Program may have not been built as asked for. Please try looking it over!\" }"
            exit
        fi
    fi
fi

echo "{ \"fractionalScore\": 1.0, \"feedback\":\"Correct, good job!\" }"
