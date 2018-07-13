extends KinematicBody2D

export(PackedScene) var Projectile

signal health_changed
signal died

const SPEED = Vector2(12.5, 0)
const MAX_HEALTH = 100

var can_shoot = true
var health = MAX_HEALTH

func _ready():
	emit_signal('health_changed', health)

func _physics_process(delta):
	if Input.is_action_pressed('left'):
		move_and_collide(SPEED * -1)
	elif Input.is_action_pressed('right'):
		move_and_collide(SPEED)

func _process(delta):
	if Input.is_action_pressed('shoot') and can_shoot:
		_spawn_projectile($LeftGun.global_position)
		_spawn_projectile($RightGun.global_position)
		can_shoot = false
		$ShotInterval.start()

func _on_ShotInterval_timeout():
	can_shoot = true

func _spawn_projectile(spawn_position):
	var new_projectile = Projectile.instance()
	get_tree().root.add_child(new_projectile)
	new_projectile.global_position = spawn_position

func damage(value):
	health -= value
	if health <= 0:
		health = 0
		emit_signal('died')
		queue_free()
	emit_signal('health_changed', health)