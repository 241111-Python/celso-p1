#!/usr/bin/bash

# define array to store users and ratios
declare -A users_ratios

for file in /mnt/c/Revature/241111-Python/Script-Game/WinLossTracker/*; do
    ratio=$(head -n 1 "$file" | awk '{print $6}')
    current_file_name=$(basename $file .txt)
    dash_position=$(expr index $current_file_name "_")
    current_user_name=${current_file_name:0:$((dash_position-1))}
    users_ratios[$current_user_name]=$ratio
done

echo "${users_ratios[@]}"
output=""
for user in "${!users_ratios[@]}"; do
    output+="$user ${users_ratios[$user]}\n"
done

echo -e "$output" | sort -k2 -nr > /mnt/c/Revature/241111-Python/Script-Game/Leaderboard/leaderboard.txt
echo $(date +"%Y-%m-%d %H:%M") >> /mnt/c/Revature/241111-Python/Script-Game/Leaderboard/leaderboard.txt

echo "Leaderboard done."