extends Node2D

var ingredients_in_cauldron : Array[String] = []
var num_ingredients : int = 0

@export var mixing_time : int = 5

@onready var cauldron_animated_sprite = $CauldronAnimatedSprite


func _on_area_2d_body_entered(body):
	if body.is_in_group("ingredients"):
		print("Cauldron received ingredient.")
		ingredients_in_cauldron.append(body.name)
		num_ingredients += 1
		print("Ingredients in cauldron: ", ingredients_in_cauldron)
		body.queue_free()
		
		if num_ingredients == 3:
			check_potions()


func check_potions():
	cauldron_animated_sprite.play("mixing")

	await get_tree().create_timer(mixing_time).timeout

	cauldron_animated_sprite.play("default")

	for potion in CheckListManager.check_list:
		if CheckListManager.check_list[potion].has_all(ingredients_in_cauldron):
			print("Potion Made!")
			CheckListManager.is_potion_made[CheckListManager.check_list_counter] = true
			num_ingredients = 0
			ingredients_in_cauldron.clear()
			GameManager.was_potion_made = true
			print(CheckListManager.is_potion_made)
			break
			
		elif CheckListManager.check_list_counter >= 2:
			# example wrong potion: eye, mushroom, wing
			print("Wrong Potion")
			num_ingredients = 0
			ingredients_in_cauldron.clear()
			GameManager.was_potion_wrong = true
			
		CheckListManager.check_list_counter += 1
	
	CheckListManager.check_list_counter = 0
