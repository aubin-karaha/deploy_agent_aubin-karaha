# deploy_agent_aubin-karaha

# Project Overview

Student Attendance Tracker Setup

Video walkthrough: https://youtu.be/mABQbSF-XvQ

## How to run it

First make the script executable:
chmod +x setup_project.sh

Then run it:
./setup_project.sh

It will ask you for a project name, just type anything and hit Enter.

Then it will ask if you want to update the attendance thresholds. Type yes or no.

That's it! It will set up everything for you.

## How to trigger the archive feature

While the script is running, press Ctrl+C.

The script will catch the interruption, save whatever was created so far into a .tar.gz archive, and delete the incomplete folder to keep things clean.

The archive will be named attendance_tracker_{yourprojectname}_archive.tar.gz
