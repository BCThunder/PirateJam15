extends CanvasLayer


func _on_play_button_pressed():
	GameManager.start_game()


func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://ui/tutorial_screen.tscn")


func _on_quit_button_pressed():
	GameManager.exit_game()
