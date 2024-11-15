function show_leaderboard(){
    local fileName="./Leaderboard/leaderboard.txt"
    # Prints header
    echo "Username  |  Win/Loss Ratio"
    echo "----------------------------------------------------------------"
    awk '{print $1," ",$2}' $fileName

    echo "----------------------------------------------------------------"
}

show_leaderboard