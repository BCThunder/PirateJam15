extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var potion_1_label = $PaperSprite/VBoxContainer/Potion1Label
@onready var potion_2_label = $PaperSprite/VBoxContainer/Potion2Label
@onready var potion_3_label = $PaperSprite/VBoxContainer/Potion3Label

var has_played_animation : bool = false
var total_potions_made : int = 0

signal SpawnIngredients


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if GameManager.was_potion_made:
		GameManager.was_potion_made = false
		
		if CheckListManager.is_potion_made[0]:
			potion_1_label.self_modulate.a = 0.2
		if CheckListManager.is_potion_made[1]:
			potion_2_label.self_modulate.a = 0.2
		if CheckListManager.is_potion_made[2]:
			potion_3_label.self_modulate.a = 0.2
		
		total_potions_made += 1
		
		if total_potions_made == 3:
			GameManager.switch_screens(GameManager.victory_screen)
		
		SpawnIngredients.emit()
		
	elif GameManager.was_potion_wrong:
		SpawnIngredients.emit()
		GameManager.was_potion_wrong = false
	
	if GameManager.show_check_list and !has_played_animation:
		animation_player.play("display_page")
		has_played_animation = true
		
	if Input.is_action_just_pressed("hide") and GameManager.show_check_list:
		animation_player.play("hide_page")
		GameManager.show_check_list = false
		has_played_animation = false
