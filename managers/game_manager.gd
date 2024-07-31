extends Node2D

# Handle ingredients
var is_dragging : bool = false

# Handle Scene Transitions
var scene_position : int = 1

# Handle Check List
var show_check_list : bool = false

# Handle Potion Making
var was_potion_made : bool = false
var was_potion_wrong : bool = false

# Preload Screens
var pause_screen = preload("res://ui/pause_screen.tscn")
var victory_screen = preload("res://ui/victory_screen.tscn")
var death_screen = preload("res://ui/death_screen.tscn")

var is_flashlight_shining : bool = false


func _ready():
	scene_position = 1


func switch_screens(new_screen):
	get_tree().paused = true
	
	var new_screen_instance = new_screen.instantiate()
	get_tree().get_root().add_child(new_screen_instance)


func resume_game():
	get_tree().paused = false
	

func start_game():
	if get_tree().paused:
		get_tree().paused = false
		
	get_tree().change_scene_to_file("res://levels/main_level.tscn")
