extends Camera2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.scene_position == 0:
		position.x = -1200
	if GameManager.scene_position == 1:
		position.x = 0
	if GameManager.scene_position == 2:
		position.x = 1200
