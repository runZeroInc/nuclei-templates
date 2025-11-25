#!/bin/sh

UPSTREAM=/Users/robking/Source/nuclei-templates

if [ ! -f contributors.json ]
then
    echo "This must be run in the nuclei-templates directory"
    exit 1
fi

find http -name \*.yaml | while read TEMPLATE
do
    if git diff --ignore-blank-lines -w -b -U0 main -- "$TEMPLATE" | grep -qE '^-\s*runzero-(match|review)'
    then
        echo "$TEMPLATE needs regneration"
    fi
done