#!/usr/bin/bash
running=true
# Creates scores directory if it doesn't exists
[[ ! -e ./Scores/ ]] && mkdir ./Scores

# Creates win/loss tracker directory if it doesn't exists
[[ ! -e ./WinLossTracker ]] && mkdir ./WinLossTracker

# Creates leaderboard directory if it doesn't exists
[[ ! -e ./Leaderboard ]] && mkdir ./Leaderboard

echo ""

# Prompt the user to input a name
echo "----------------------------------------------------------------"
echo "Please, enter a username: "
read -r userName
echo ""

echo "----------------------------------------------------------------"
echo ""

# Welcome text when the game first runs
echo "Welcome to Rock Paper Scissors; $userName"

echo ""

while $running; do

echo -e "Main Menu:\n1.Play\n2.WinLossTracker\n3.Leaderboard\n4.Exit"
echo ""

echo "----------------------------------------------------------------"
read -r res

if [[ res -gt 4 || res -lt 0 ]]; then
	echo ""
	echo "Please select only the numbers shown on the screen (1-4)"
	echo ""
	echo "----------------------------------------------------------------"
	echo ""
else
	[[ $res -eq 4 ]] && break;

    [[ $res -eq 1 ]] && source ./Functions/RockPaperScissors.sh "$userName"

	[[ $res -eq 2 ]] && source ./Functions/win_loss_tracker.sh "$userName"

	[[ $res -eq 3 ]] && source ./Functions/leaderboard.sh


fi
done

echo "Thanks for playing $userName"
echo "----------------------------------------------------------------"

