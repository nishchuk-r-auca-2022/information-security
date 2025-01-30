end_time="18:00"
current_time=$(date +"%H:%M")

remaining=$(date -u -d "00:00 $(date -d "$end_time today" +%s) sec - $(date -d "$current_time today" +%s) sec" +"%H:%M")

echo "Current time: $current_time"
echo "Work day ends after $remaining"
