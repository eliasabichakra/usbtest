#!/bin/bash



# Function to list USB devices

list_usb_devices() {

  lsusb

}



# Store the initial list of USB devices

initial_list=$(list_usb_devices)



# Infinite loop to continuously monitor USB devices

while true; do

  # Get the current list of USB devices

  current_list=$(list_usb_devices)



  # Use diff to find differences between the lists

  diff_output=$(diff <(echo "$initial_list") <(echo "$current_list"))



  # Check if there are differences

  if [ -n "$diff_output" ]; then

    echo "USB device change detected:"

    echo "$diff_output"



    # Notify with a message that a new USB device is connected

    notify-send "A new USB device has been connected."



    # Update the initial list to match the current list

    initial_list="$current_list"

   fi



     sleep 5  # Delay between checks (in seconds)

done

