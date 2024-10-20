extends CanvasLayer

@onready var left_arrow = $MarginContainer/ArrowScrollHBox/HBoxContainer/LeftArrow
@onready var left_arrow_sprite = $MarginContainer/ArrowScrollHBox/HBoxContainer/LeftArrow/Sprite2D
@onready var right_arrow = $MarginContainer/ArrowScrollHBox/HBoxContainer2/RightArrow
@onready var right_arrow_sprite = $MarginContainer/ArrowScrollHBox/HBoxContainer2/RightArrow/Sprite2D
@onready var up_arrow = $MarginContainer/SummonHBox/UpArrow
@onready var up_arrow_sprite = $MarginContainer/SummonHBox/UpArrow/Sprite2D
@onready var flashlight = $MarginContainer/SummonHBox/Flashlight
@onready var flashlight_sprite = $MarginContainer/SummonHBox/Flashlight/Sprite2D

var left_arrow_selected : bool = false
var right_arrow_selected : bool = false
var up_arrow_selected : bool = false
var flashlight_selected : bool = false

@onready var animation_player = $CanvasLayer/AnimationPlayer

signal shine_flashlight

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.scene_position == 0:
		left_arrow.visible = false
		right_arrow.visible = true
		up_arrow.visible = false
		flashlight.visible = true
	if GameManager.scene_position == 1:
		left_arrow.visible = true
		right_arrow.visible = true
		up_arrow.visible = true
		flashlight.visible = false
	if GameManager.scene_position == 2:
		left_arrow.visible = true
		right_arrow.visible = false
		up_arrow.visible = false
		flashlight.visible = true
		
	
	if Input.is_action_just_pressed("select"):
		if left_arrow_selected:
			GameManager.scene_position -= 1
		elif right_arrow_selected:
			GameManager.scene_position += 1
		elif up_arrow_selected:
			GameManager.show_check_list = true


func _on_left_arrow_mouse_entered():
	left_arrow_sprite.scale = Vector2(1.1, 1.1)
	left_arrow_selected = true


func _on_right_arrow_mouse_entered():
	right_arrow_sprite.scale = Vector2(1.1, 1.1)
	right_arrow_selected = true


func _on_left_arrow_mouse_exited():
	left_arrow_sprite.scale = Vector2(1.0, 1.0)
	left_arrow_selected = false


func _on_right_arrow_mouse_exited():
	right_arrow_sprite.scale = Vector2(1.0, 1.0)
	right_arrow_selected = false


func _on_up_arrow_mouse_entered():
	up_arrow_sprite.scale = Vector2(1.1, 1.1)
	up_arrow_selected = true


func _on_up_arrow_mouse_exited():
	up_arrow_sprite.scale = Vector2(1.0, 1.0)
	up_arrow_selected = false


func _on_pause_button_pressed():
	left_arrow.visible = false
	right_arrow.visible = false
	up_arrow.visible = false
	GameManager.switch_screens(GameManager.pause_screen)


func _on_flashlight_mouse_entered():
	flashlight_sprite.scale = Vector2(1.1, 1.1)
	flashlight_selected = true
	GameManager.is_flashlight_shining = true
	shine_flashlight.emit()


func _on_flashlight_mouse_exited():
	flashlight_sprite.scale = Vector2(1.0, 1.0)
	flashlight_selected = false
	GameManager.is_flashlight_shining = false
	shine_flashlight.emit()
