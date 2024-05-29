#!/bin/bash

# Function to handle termination signals
cleanup() {
    echo "Terminating the script..."
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM signals and call the cleanup function
trap cleanup SIGINT SIGTERM

# Prompt the user for a port number
read -p "Enter port number to listen on: " port

# Check if the port number is valid (a positive integer)
if ! [[ "$port" =~ ^[0-9]+$ ]]; then
    echo "Error: Port number must be a positive integer."
    exit 1
fi

# Infinite loop to keep netcat listening on the specified port
while true; do
    nc -l "$port"
done
