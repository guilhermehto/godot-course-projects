extends Node

var Formation = preload('res://enemy/formation/Formation.tscn')

func _ready():
	_spawn_formation()

func _spawn_formation():
	var new_formation = Formation.instance()
	new_formation.connect('destroyed', self, '_on_formation_destroyed')
	new_formation.position = _get_random_position()
	add_child(new_formation)

func _on_formation_destroyed():
	_spawn_formation()

func _on_Player_died():
	$Timer.start()

func _get_random_position():
	var index = int(rand_range(0, 3))
	match index:
		0:
			return $SpawnPositionLeft.position
		1:
			return $SpawnPositionCenter.position
		2:
			return $SpawnPositionRight.position

func _on_Timer_timeout():
	get_tree().reload_current_scene()
