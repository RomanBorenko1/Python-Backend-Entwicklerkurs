#!/bin/bash

read -p 'Enter the address to ping: ' HOST
count_fail=0

while true; do

	ping_output=$(ping -c 1 -w 1 "$HOST" 2>/dev/null)
	if [[ $? -ne 0 ]]; then 
	echo "Ping error"
	((count_fail++))
	else
	    time_ms=$(echo "$ping_output" | awk -F'time=' '{print $2}' | cut -d' ' -f1)
	echo "Successful ping ${time_ms} ms"
	if (($(echo "$time_ms > 100" | bc -l) )); then
	echo "Ping time exceeded 100ms"
	fi
	count_fail=0
	fi
	if (( count_fail >= 3 )); then echo "failed ping attempt 3 times"
	count_fail=0
	fi
	sleep 1
done
