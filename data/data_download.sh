#!/bin/bash
# Download for loop

years='2015 2016 2017 2018'
months='01 02 03 04 05 06 07 08 09 10 11 12'
for year in $years
do
    for month in $months
    do
        s1="https://s3.amazonaws.com/hubway-data/$year$month-hubway-tripdata.zip"
        s2="$year$month-hubway-tripdata.zip"
        
        if [ "$year" = "2018" ]; then
            if [ "$month" -gt "04" ]; then
                s1="https://s3.amazonaws.com/hubway-data/$year$month-bluebikes-tripdata.zip"
                s2="$year$month-bluebikes-tripdata.zip"
            fi
        fi
        wget $s1
        unzip $s2
        rm $s2
    done
done

mv "201801_hubway_tripdata.csv" "201801-hubway-tripdata.csv"
mv "201802_hubway_tripdata.csv" "201802-hubway-tripdata.csv"
mv "201803_hubway_tripdata.csv" "201803-hubway-tripdata.csv"

echo All done