#!/bin/bash

# URL to request
URL="http://127.0.0.1:6789/openstreetmap-carto-walking/#16/64.1446322/-21.9483251"

# Perform the request and time the full response using curl
response=$(curl -w "\ntime_namelookup: %{time_namelookup}\ntime_connect: %{time_connect}\ntime_appconnect: %{time_appconnect}\ntime_pretransfer: %{time_pretransfer}\ntime_redirect: %{time_redirect}\ntime_starttransfer: %{time_starttransfer}\ntime_total: %{time_total}\n" -s "$URL")

# Extract the timing information
time_info=$(echo "$response" | grep -E "^time_")

# Extract the response body by removing the timing information
response_body=$(echo "$response" | sed '/^time_/d')

# Save the response body to a temporary HTML file
tmp_file=$(mktemp /tmp/response.XXXXXX.html)
echo "$response_body" > "$tmp_file"

# Open the temporary HTML file in the default web browser
xdg-open "$tmp_file" 2>/dev/null || open "$tmp_file" 2>/dev/null || echo "Could not detect the web browser to open the file"

# Print the timing information
echo -e "\nTiming Information:"
echo "$time_info"
