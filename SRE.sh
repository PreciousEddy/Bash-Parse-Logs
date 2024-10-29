#!/bin/bash

# Define the file to save the logs
log_file="web_logs.txt"

# Fetch the logs and save them to the file
curl -s https://coderbyte.com/api/challenges/logs/web-logs-raw -o "$log_file"

# Loop through each line in the saved log file
while IFS= read -r line || [[ -n "$line" ]]; do
  # Check if the line contains the string "coderbyte heroku/router"
  if [[ "$line" == *"coderbyte heroku/router"* ]]; then
    # Extract request_id using a more flexible approach
    request_id=$(echo "$line" | grep -o 'request_id=[^ ]*' | cut -d'=' -f2)

    # Extract the fwd value (either MASKED or an IP)
    fwd_value=$(echo "$line" | grep -o 'fwd="[^"]*"' | cut -d'"' -f2)

    # Print the masked/unmasked IP with request_id accordingly
    if [[ "$fwd_value" == "MASKED" ]]; then
      echo "$request_id [M]"
    else
      echo "$request_id [$fwd_value]"
    fi
  fi
done < "$log_file"
