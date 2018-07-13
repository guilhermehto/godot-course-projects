extends Node2D

signal destroyed

const MOVE_SPEED = 250
const MOVE_OFFSET = 100

var enemies_in_formation = 0
var direction = 1
var start_position

func _ready():
	start_position = position.x
	enemies_in_formation = get_child_count()
	for enemy in get_children():
		enemy.connect('destroyed', self, '_on_enemy_destroyed')

func _process(delta):
	position.x += MOVE_SPEED * delta * direction
	
	if position.x >= start_position + MOVE_OFFSET:
		direction *= -1
		position.x = start_position + MOVE_OFFSET
	elif position.x <= start_position - MOVE_OFFSET:
		direction *= -1
		position.x = start_position - MOVE_OFFSET
	
	if position.y != 300:
		position.y += MOVE_SPEED * delta
		if position.y > 300:
			position.y = 300

func _on_enemy_destroyed():
	enemies_in_formation -= 1
	if enemies_in_formation == 0:
		emit_signal('destroyed')
		queue_free()
