function update_tracker(){
    local fileName=$1

    for file in $fileName; do
        read wins losses <<< $(awk '{ if($10 == 1) wins+=1; else losses+=1 } END { print wins, losses }' "$file") 
        total_games=$(wc -l < "$file")
        ratio=$(echo "scale=2; $wins/$losses" | bc)
        current_time=$(date +"%Y-%m-%d %H:%M")

        current_file_name=$(basename $file .txt)
        dash_position=$(expr index $current_file_name "_")
        current_user_name=${current_file_name:0:$((dash_position-1))}
        echo "Total Games: $total_games Win/Loss Ratio: $ratio Current Time: $current_time" > /mnt/c/Revature/241111-Python/Script-Game/WinLossTracker/${current_user_name}_WinLossTracker.txt
    done

    line=$(head -n 1 ./WinLossTracker/${current_user_name}_WinLossTracker.txt)

    total_games=$(awk '{ print $3 }' ./WinLossTracker/${current_user_name}_WinLossTracker.txt)


    echo "----------------------------------------------------------------"
    echo ""

    echo "Total Games: $total_games"
    echo "Win/Loss Ratio: $ratio"
    echo "Current Time: $current_time"

    echo ""
    echo "----------------------------------------------------------------"


}

function find_user_games(){
    local userName=$1
    echo ""

    # Looks for the file of the user
    [[ -e ./Scores/${userName}_Games.txt ]] && update_tracker "./Scores/${userName}_Games.txt" || echo "No games found for $userName"

    echo ""
}

find_user_games "$@"