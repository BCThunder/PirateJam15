extends Node2D

@onready var eyeball_marker = $IngredientSpawnPoints/EyeballMarker
@onready var mushroom_marker = $IngredientSpawnPoints/MushroomMarker
@onready var dragon_egg_marker = $IngredientSpawnPoints/DragonEggMarker
@onready var bat_wing_marker = $IngredientSpawnPoints/BatWingMarker

var eyeball = preload("res://entities/eyeball.tscn")
var dragon_egg = preload("res://entities/dragon_egg.tscn")
var bat_wing = preload("res://entities/bat_wing.tscn")
var mushroom = preload("res://entities/mushroom.tscn")


func clear_ingredients():
	for ingredient in get_tree().get_nodes_in_group("ingredients"):
		ingredient.free()


func spawn_ingredients():
	var eyeball_instance = eyeball.instantiate() as CharacterBody2D
	eyeball_instance.global_position = eyeball_marker.global_position
	eyeball_instance.add_to_group("ingredients")
	eyeball_instance.z_index += 1
	
	var dragon_egg_instance = dragon_egg.instantiate() as CharacterBody2D
	dragon_egg_instance.global_position = dragon_egg_marker.global_position
	dragon_egg_instance.add_to_group("ingredients")
	dragon_egg_instance.z_index += 1
	
	var bat_wing_instance = bat_wing.instantiate() as CharacterBody2D
	bat_wing_instance.global_position = bat_wing_marker.global_position
	bat_wing_instance.add_to_group("ingredients")
	bat_wing_instance.z_index += 1
	
	var mushroom_instance = mushroom.instantiate() as CharacterBody2D
	mushroom_instance.global_position = mushroom_marker.global_position
	mushroom_instance.add_to_group("ingredients")
	mushroom_instance.z_index += 1
	
	get_node("Ingredients").add_child(eyeball_instance)
	get_node("Ingredients").add_child(dragon_egg_instance)
	get_node("Ingredients").add_child(bat_wing_instance)
	get_node("Ingredients").add_child(mushroom_instance)


func _on_check_list_spawn_ingredients():
	clear_ingredients()
	spawn_ingredients()
