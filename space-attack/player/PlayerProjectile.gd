extends Area2D

export var Damage = 25
export var Speed = 1500

func _process(delta):
	position.y -= Speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_PlayerProjectile_body_entered(body):
	if body.is_in_group('enemies'):
		body.damage(Damage)
		queue_free()
