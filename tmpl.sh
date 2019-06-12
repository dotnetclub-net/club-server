#!/bin/bash

# $$xxxx  => SECURE_xxxx

dump_vars() {
    compgen -v | while read -r VARNAME; do
        PREFIX="${VARNAME:0:7}"
        if [ "$PREFIX" == "SECURE_" ] ; then
            echo "$VARNAME"
        fi
    done
}


tmpl() {
    local FILENAME
    local CONTENT
    local VARS
    local EXP
    
    FILENAME=$1
    CONTENT=`cat $FILENAME`
    VARS=`dump_vars`
    
    for VARNAME in $VARS; do
        EXP="\\\$\\\$${VARNAME:7}"
        CONTENT=`echo "$CONTENT" | sed "s/$EXP/${!VARNAME}/g"`
    done

    echo "$CONTENT"
}

FILE=$1
if ! [ -z "$FILE" ] ; then
    tmpl $FILE
fi

