extends Node2D

@onready var animation_player = $AnimationPlayer
var has_played_animation : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.show_check_list and !has_played_animation:
		animation_player.play("display_page")
		has_played_animation = true
		
	if Input.is_action_just_pressed("hide"):
		animation_player.play("hide_page")
		GameManager.show_check_list = false
		has_played_animation = false
