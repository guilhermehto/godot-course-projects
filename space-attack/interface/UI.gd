extends Control

func _on_Player_health_changed(value):
	$HealthBar.value = value
