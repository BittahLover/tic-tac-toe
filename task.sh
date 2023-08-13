#!/usr/bin/env bash


board=( "1" "2" "3" "4" "5" "6" "7" "8" "9" )
is_x=true
finish_game=false
move_number=0


function print_board
{
	clear
	echo "\033[24;3;44m-------------------------------TIC-TACK-TOE GAME--------------------------------\033[0m\n"
	echo "				 -------------"
	for i in 0 1 2
	do	
		echo "				 | ${board[0+i*3]} | ${board[1+i*3]} | ${board[2+i*3]} |"
		echo "                                 -------------"
	done
}

function check_number()
{
	if [[ $is_x = true ]]; then
				if [[ ${board[$1]} != X ]]; then
					if [[ ${board[$1]} != 0 ]]; then
						board[$1]=X
						((move_number++))
						is_x=false
						return
					else
						echo "INCORRECT input"
						sleep 1
						return
					fi
				else
					echo "INCORRECT input"
					sleep 1
					return
				fi
			fi

			if [[ $is_x = false ]]; then
				if [[ ${board[$1]} != X ]]; then
					if [[ ${board[$1]} != 0 ]]; then
						board[$1]=0
						((move_number++))
						is_x=true
						return
					else
						echo "INCORRECT input"
						sleep 1
						return
					fi
				else
					echo "INCORRECT input"
					sleep 1
					return
				fi
			fi 

			echo "INCORRECT input"
			sleep 1

}

function enter_number
{
	if [[ $is_x = true ]]; then
		read -p "Enter for X: " value
	else
		read -p "Enter for 0: " value
	fi


	case $value in
	[1-9] )
		
		case $value in
		[1-1] )
				check_number 0 ;;	

		[2-2] )
				check_number 1 ;;

		[3-3] )
				check_number 2 ;;
			
		[4-4] )
				check_number 3 ;;

		[5-5] )
				check_number 4 ;;

		[6-6] )
				check_number 5 ;;

		[7-7] )
				check_number 6 ;;

		[8-8] )
				check_number 7 ;;

		[9-9] )
				check_number 8 ;;
		* )
			echo "INCORRECT input"
			sleep 1 ;;
			
		esac ;;
	* )
		echo "INCORRECT input"
		sleep 1 ;;
		
	esac

}


chech_winner()
{
	finish_game=true

	if [ ${board[$1]} = "X" ]
	then
		echo "X is winner!"
	else
		echo "0 is winner!"
	fi

}

function check_board
{
	if [[ ${board[0]} = ${board[1]} && ${board[0]} = ${board[2]} && ${board[1]} = ${board[2]} ]]
	then

		chech_winner 0

		return
		
	elif [[ ${board[3]} = ${board[4]} && ${board[3]} = ${board[5]} && ${board[4]} = ${board[5]} ]]
	then

			
		chech_winner 3

		return

	elif [[ ${board[6]} = ${board[7]} && ${board[6]} = ${board[8]} && ${board[7]} = ${board[8]} ]]
	then

			
		chech_winner 6

		return

	elif [[ ${board[0]} = ${board[3]} && ${board[0]} = ${board[6]} && ${board[3]} = ${board[6]} ]]
	then
		
		chech_winner 0

		return

	elif [[ ${board[1]} = ${board[4]} && ${board[1]} = ${board[7]} && ${board[4]} = ${board[7]} ]]
	then

		chech_winner 1

		return

	elif [[ ${board[2]} = ${board[5]} && ${board[2]} = ${board[8]} && ${board[5]} = ${board[8]} ]]
	then

		chech_winner 2

		return

	elif [[ ${board[0]} = ${board[4]} && ${board[0]} = ${board[8]} && ${board[4]} = ${board[8]} ]]
	then

		chech_winner 0

		return

	elif [[ ${board[2]} = ${board[4]} && ${board[2]} = ${board[6]} && ${board[4]} = ${board[6]} ]]
	then

		chech_winner 2

		return

	elif [[ $move_number = 9 ]]; then
		finish_game=true
		echo "DRAW!"
	fi
}

print_board
while [ $finish_game = false ]
do
	enter_number
	print_board
	check_board
done