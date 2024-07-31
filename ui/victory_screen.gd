extends CanvasLayer


func _on_main_screen_button_pressed():
	get_tree().paused = false
	queue_free()
	get_tree().change_scene_to_file("res://ui/start_menu.tscn")
