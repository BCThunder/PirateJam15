extends CanvasLayer

@onready var left_arrow = $MarginContainer/HBoxContainer/HBoxContainer/LeftArrow
@onready var right_arrow = $MarginContainer/HBoxContainer/HBoxContainer2/RightArrow
@onready var left_arrow_sprite = $MarginContainer/HBoxContainer/HBoxContainer/LeftArrow/Sprite2D
@onready var right_arrow_sprite = $MarginContainer/HBoxContainer/HBoxContainer2/RightArrow/Sprite2D

var left_arrow_selected : bool = false
var right_arrow_selected : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.scene_position == 0:
		left_arrow.visible = false
		right_arrow.visible = true
	if GameManager.scene_position == 1:
		left_arrow.visible = true
		right_arrow.visible = true
	if GameManager.scene_position == 2:
		left_arrow.visible = true
		right_arrow.visible = false
	
	if Input.is_action_just_pressed("select"):
		if left_arrow_selected:
			GameManager.scene_position -= 1
		elif right_arrow_selected:
			GameManager.scene_position += 1


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
