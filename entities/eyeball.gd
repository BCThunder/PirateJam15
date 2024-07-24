extends CharacterBody2D

@export var GRAVITY : int = 1
@export var base_scale : float = 0.4
@export var enlarged_scale : float = 0.5

var draggable : bool = false
var offset : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("select"):
			offset = get_global_mouse_position() - global_position
			GameManager.is_dragging = true
		if Input.is_action_pressed("select"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("select"):
			GameManager.is_dragging = false


func _physics_process(delta):
	if not is_on_floor():
		velocity.y = GRAVITY * delta
	
	move_and_collide(velocity)


func _on_selectable_area_2d_mouse_entered():
	if not GameManager.is_dragging:
		draggable = true
		scale = Vector2(enlarged_scale, enlarged_scale)


func _on_selectable_area_2d_mouse_exited():
	if not GameManager.is_dragging:
		draggable = false
		scale = Vector2(base_scale, base_scale)
