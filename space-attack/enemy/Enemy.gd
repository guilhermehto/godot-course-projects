extends KinematicBody2D

signal destroyed

export(PackedScene) var Projectile
export(float) var MaxShootInterval = 1.0
export(float) var MinShootInterval = 0.25

var health = 50

func _ready():
	randomize()
	_randomize_timer()

func _on_Timer_timeout():
	_randomize_timer()
	_shoot()

func _shoot():
	var new_projectile = Projectile.instance()
	new_projectile.global_position = global_position
	get_tree().get_root().add_child(new_projectile)
	$Timer.start()

func _randomize_timer():
	$Timer.wait_time = rand_range(MinShootInterval, MaxShootInterval)

func damage(value):
	health -= value
	if health <= 0:
		health = 0
		emit_signal('destroyed')
		queue_free()