extends Control

signal time_up
const GAME_TIME = 5
var score = 0

func _ready():
	$Score.text = str(score)
	$TimeLeft.max_value = GAME_TIME
	$TimeLeft.value = GAME_TIME

func _process(delta):
	$TimeLeft.value -= delta
	if $TimeLeft.value <= 0:
		$TimeLeft.value = 0
		emit_signal('time_up')
		set_process(false)
		


func _on_Player_punched_tree(player_position):
	$TimeLeft.value += 0.25
	score += 1
	$Score.text = str(score)
