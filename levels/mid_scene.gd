extends Node2D

@onready var eyeball_marker = $IngredientSpawnPoints/EyeballMarker
@onready var dragon_egg_marker = $IngredientSpawnPoints/DragonEggMarker
@onready var bat_wing_marker = $IngredientSpawnPoints/BatWingMarker
@onready var mushroom_marker = $IngredientSpawnPoints/MushroomMarker
@onready var animation_player = $AnimationPlayer

var eyeball = preload("res://entities/eyeball.tscn")
var dragon_egg = preload("res://entities/dragon_egg.tscn")
var bat_wing = preload("res://entities/bat_wing.tscn")
var mushroom = preload("res://entities/mushroom.tscn")

var ingr_marker_index : int = 0
var ingredients : Array = []
var markers : Array = []


func _ready():
	ingredients = [eyeball, dragon_egg, bat_wing, mushroom]
	markers = [eyeball_marker, dragon_egg_marker, bat_wing_marker, mushroom_marker]


func clear_ingredients():
	for ingredient in get_tree().get_nodes_in_group("ingredients"):
		ingredient.free()


func spawn_ingredients():
	animation_player.play("summon_ingredients")
	
	await get_tree().create_timer(1).timeout
	
	for ingredient in ingredients:
		var ingr_instance = ingredient.instantiate() as CharacterBody2D
		ingr_instance.global_position = markers[ingr_marker_index % 4].global_position
		ingr_instance.add_to_group("ingredients")
		ingr_instance.z_index += 1
		
		ingr_marker_index += 1
		get_node("Ingredients").add_child(ingr_instance)
		
	await get_tree().create_timer(1).timeout
	
	animation_player.play("finish_summon")


func _on_check_list_spawn_ingredients():
	clear_ingredients()
	spawn_ingredients()
