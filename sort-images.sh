#!/usr/bin/env bash
echo "Let's sort images"

if [ -z "$1" ]
then
    echo "Error: No directory provided. Please specify a directory."
    exit 1
fi

dir="$1"
for file in "$dir"/*
do
    filename=$(basename "$file")
    echo Filename: "$filename"
    if [[ -f "$file" ]]; then
        year=${filename:0:4}
        month=${filename:4:2}
        day=${filename:6:2}
        if [[ $year -gt 2010 && $year -lt 2080 ]]; then
            if [[ ! -d "$dir/$year/$month/$day" ]]; then
                mkdir -p "$dir/$year/$month/$day"
            fi
            mv "$file" "$dir/$year/$month/$day/."
            echo "Year: "$year
            echo "Month: "$month
            echo "Day: "$day
        fi
    fi
done