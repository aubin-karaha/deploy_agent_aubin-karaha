#!/bin/bash

#Trap signal to handle user interruptions and save them as archives

cleanup() {

    echo " " 
    echo "You pressed Ctrl+C! Saving progress..."
    tar -czf attendance_tracker_${var}_archive.tar.gz attendance_tracker_${var}/
    rm -rf attendance_tracker_${var}/
    echo "Done. Check attendance_tracker_${var}_archive.tar.gz"
    exit 1
}

trap 'cleanup' SIGINT




#Creating the input and parent directories

read -p "Enter project name: " var

mkdir -p attendance_tracker_$var/Helpers
mkdir -p attendance_tracker_$var/reports

cp attendance_checker.py attendance_tracker_$var/
cp assets.csv attendance_tracker_$var/Helpers/
cp config.json attendance_tracker_$var/Helpers/
cp reports.log attendance_tracker_$var/reports/




#Stream editor to prompt the user whether they would like to update attendance thresholds

read -p "Do you want to update attendance thresholds? (yes/no): " response

if [ "$response" == "yes" ]; then
    read -p "Enter new warning threshold (default 75): " warning
    read -p "Enter new failure threshold (default 50): " failure

    sed -i "s/\"warning\": 75/\"warning\": $warning/" attendance_tracker_$var/Helpers/config.json
    sed -i "s/\"failure\": 50/\"failure\": $failure/" attendance_tracker_$var/Helpers/config.json

    echo "Thresholds updated successfully!"
fi




# Performing a health check to verify if Python3 is installed

echo "Checking if Python3 is installed..."

python3 --version

if [ $? -eq 0 ]; then
    echo "Python3 is installed"
else
    echo "WARNING: Python3 is not found"
fi
