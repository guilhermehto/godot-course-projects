extends Node


func _on_UI_time_up():
	$Timer.start()

func _on_Timer_timeout():
	get_tree().reload_current_scene()


func _on_Player_hit_by_axe():
	$Timer.start()
