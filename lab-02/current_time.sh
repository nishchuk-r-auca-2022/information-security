end_time="18:00"
current_time=$(date +"%H:%M")

current_seconds=$(date -j -f "%H:%M" "$current_time" "+%s")
end_seconds=$(date -j -f "%H:%M" "$end_time" "+%s")

remaining_seconds=$(( end_seconds - current_seconds ))

if [ $remaining_seconds -gt 0 ]; then
    hours=$(( remaining_seconds / 3600 ))
    minutes=$(( (remaining_seconds % 3600) / 60 ))
    echo "Current time: $current_time"
    echo "Work day ends after ${hours} hours and ${minutes} minutes"
else
    echo "Current time: $current_time"
    echo "Work day is over."
fi

