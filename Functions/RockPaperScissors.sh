function run_game(){
	# Setting array of options for the game, and score variables
	local myOptions=("rock" "paper" "scissors")
	local playing=true
	local userName=$1

	echo ""

	while $playing; do
	echo -e "Select Option:\n1.Rock\n2.Paper\n3.Scissors\n4.Back to main menu\n"

	echo "----------------------------------------------------------------"
	read -r res

	if [[ res -gt 4 || res -lt 0 ]]; then
		echo ""
		echo "Please select only the numbers shown on the screen (1-5)"
		echo ""
		echo "----------------------------------------------------------------"
		echo ""
	else
		[[ $res -eq 4 ]] && break;
	# Making the computer choice random between 0-2 (range of my array size)
	computerChoice=$(($RANDOM%3))

	# Choosing my computer choice value using my random number
	computerChoice=${myOptions[$computerChoice]}

	# Choosing my player choice value using the user input
	playerChoice=${myOptions[$((res-1))]}

	source ./Functions/winner.sh
	RESULT=$(winner "$computerChoice" "$playerChoice")
	gameDate=$(date +"%Y-%m-%d %H:%M:%S")

	if grep -q "Computer Wins" <<< "$RESULT"; then
		
		[[ -e ./Scores/${userName}_Games.txt ]] && echo "Game at: $gameDate, Computer Score: 1, Player Score: 0" >> ./Scores/${userName}_Games.txt || echo "Game at: $gameDate, Computer Score: 1, Player Score: 0" > ./Scores/${userName}_Games.txt

	elif grep -q "Player Wins" <<< "$RESULT"; then

		[[ -e ./Scores/${userName}_Games.txt ]] && echo "Game at: $gameDate, Computer Score: 0, Player Score: 1" >> ./Scores/${userName}_Games.txt || echo "Game at: $gameDate, Computer Score: 0, Player Score: 1" > ./Scores/${userName}_Games.txt

	elif grep -q "Tie" <<< "$RESULT"; then

		[[ -e ./Scores/${userName}_Games.txt ]] && echo "Game at: $gameDate, Computer Score: 0, Player Score: 0" >> ./Scores/${userName}_Games.txt || echo "Game at: $gameDate, Computer Score: 0, Playeer Score: 0" > ./Scores/${userName}_Games.txt

	fi
	echo ""
	echo "$RESULT"
	echo ""
	echo "----------------------------------------------------------------"

	fi
	done
}

run_game "$@"

