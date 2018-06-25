extends Node

var guess 
var min_guessed = 0
var max_guessed = 1001
var ended = false

func _ready():
	guess = (min_guessed + max_guessed) / 2
	$Message.text = "Is " + str(guess) + " your number?"


func _try_guess(type):
	if type == "up":
		min_guessed = guess
	else:
		max_guessed = guess
	guess = (min_guessed + max_guessed) / 2
	$Message.text = "Is " + str(guess) + " your number?"

func _end_game():
	ended = true
	$Message.text = "Yes! I knew it! Your number was: " + str(guess) + "!"
	$Correct.text = "Restart"
	$Greater.disabled = true
	$Lesser.disabled = true

func _on_Greater_pressed():
	_try_guess("up")


func _on_Lesser_pressed():
	_try_guess("down")

func _on_Correct_pressed():
	if !ended:
		_end_game()
	else:
		get_tree().reload_current_scene()
