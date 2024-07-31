extends Node2D

@export var event_timer : Timer
@export var level_buffer_timer : Timer
@export var kill_timer : Timer
@export var flashlight_timer : Timer

@export var background_sprite : Sprite2D

var enemy_stage_placement : int = 0 # placement of enemy in the level
var level_time_buffer : int = 15 # wait num seconds before starting event roll
var kill_time : int = 5 # how long the enemy waits until it kills the player

@export var enemy_sprite_foreground : Sprite2D
@export var enemy_sprite_midground : Sprite2D
@export var move_chance : int = 3 # chance for enemy to move after # seconds (1/move_chance)


# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_sprite_foreground.visible = false
	enemy_sprite_midground.visible = false


func check_enemy_placement():
	if enemy_stage_placement == 0:
		enemy_sprite_foreground.visible = false
		enemy_sprite_midground.visible = false
	elif enemy_stage_placement == 1:
		enemy_sprite_foreground.visible = false
		enemy_sprite_midground.visible = true
	elif enemy_stage_placement == 2:
		enemy_sprite_foreground.visible = true
		enemy_sprite_midground.visible = false
		
		kill_timer.start()
		print("Started kill timer")


func _on_level_buffer_timer_timeout():
	event_timer.start()


func _on_event_timer_timeout():
	if enemy_stage_placement == 2 and GameManager.is_flashlight_shining:
		print("trying to kill")
		return
	
	print("Do event roll.")
	var rand_int = randi_range(1, move_chance)
	
	print("Rand_int: ", rand_int)
	if rand_int == move_chance:
		var rand_move = randi_range(1, 10)
		
		# enemy has a 70% chance of moving forward, else move backwards
		if rand_move <= 7 and enemy_stage_placement < 2:
			enemy_stage_placement += 1
		elif rand_move > 7 and enemy_stage_placement > 0:
			enemy_stage_placement -= 1
			
	check_enemy_placement()


func _on_kill_timer_timeout():
	print("You lose...")
	
	GameManager.switch_screens(GameManager.death_screen)


func _on_flashlight_timer_timeout():
	if enemy_stage_placement >= 1:
		enemy_stage_placement = 0


func _on_ui_shine_flashlight():
	if GameManager.is_flashlight_shining:
		background_sprite.self_modulate.a *= 0.8
	if not GameManager.is_flashlight_shining:
		background_sprite.self_modulate.a *= 1.25
		
	if enemy_stage_placement >= 1 and GameManager.is_flashlight_shining:
		print("Start Flashlight Timer")
		flashlight_timer.start()
		
		if enemy_stage_placement == 2:
			print("Stop Killing")
			kill_timer.stop()
