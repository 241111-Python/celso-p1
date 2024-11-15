function winner(){
#	Variables

 	local computerChoice=$1
    local playerChoice=$2

# 	Conditions to know who won

	if [[ "$computerChoice" == "$playerChoice" ]]; then

        echo "Tie: Computer and player chose the same."

	elif [[ "paper" == "$computerChoice" && "$playerChoice" != "scissors"  ]]; then

        echo "Computer Wins: it chose $computerChoice, player chose $playerChoice."

	elif [[ "rock" == "$computerChoice" && "$playerChoice" != "paper" ]]; then

        echo "Computer Wins: it chose $computerChoice, player chose $playerChoice."

	elif [[ "scissors" == "$computerChoice" && "$playerChoice" != "rock" ]]; then

        echo "Computer Wins: it chose $computerChoice, player chose $playerChoice."

	else
        echo "Player Wins: it chose $playerChoice, computer chose $computerChoice."

	fi
}
