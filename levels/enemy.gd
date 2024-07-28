extends Node2D

@export var event_timer : Timer
@export var level_buffer_timer : Timer

var enemy_stage_placement : int = 0 # placement of enemy in the level
var level_time_buffer : int = 15 # wait num seconds before starting event roll

@export var enemy_sprite_foreground : Sprite2D
@export var enemy_sprite_midground : Sprite2D
@export var move_chance : int = 6 # chance for enemy to move after # seconds (1/move_chance)


# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_sprite_foreground.visible = false
	enemy_sprite_midground.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_stage_placement == 0:
		enemy_sprite_foreground.visible = false
		enemy_sprite_midground.visible = false
	elif enemy_stage_placement == 1:
		enemy_sprite_foreground.visible = false
		enemy_sprite_midground.visible = true
	elif enemy_stage_placement == 2:
		enemy_sprite_foreground.visible = true
		enemy_sprite_midground.visible = false


func _on_level_buffer_timer_timeout():
	event_timer.start()


func _on_event_timer_timeout():
	print("Do event roll.")
	var rand_int = randi_range(1, 9)
	
	if rand_int > move_chance:
		if enemy_stage_placement < 2:
			enemy_stage_placement += 1
			
	else:
		if enemy_stage_placement > 0:
			enemy_stage_placement -= 1
