extends Area2D


var center_offset
var screen_center

signal punched_tree
signal hit_by_axe

func _ready():
	screen_center = get_viewport_rect().size.x / 2
	center_offset = position.x - screen_center
	connect("area_entered", self, "_on_area_entered")

func _input(event):
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		if event.position.x < screen_center:
			position.x = screen_center - center_offset
			scale.x = -abs(scale.x)
		else:
			position.x = screen_center + center_offset
			scale.x = abs(scale.x)
		$Animation.play("punch")
		emit_signal("punched_tree", position.x)

func _on_area_entered(area):
	emit_signal("hit_by_axe")
	set_process_input(false)
	$Grave.show()
	$Body.hide()
	
