extends Node2D

var ingredients_in_cauldron : Array[String] = []
var num_ingredients : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_ingredients == 4:
		if CheckList.check_list.has_all(ingredients_in_cauldron):
			print("Potion Made!")
			num_ingredients = 0


func _on_area_2d_body_entered(body):
	if body.is_in_group("ingredients"):
		print("Cauldron received ingredient.")
		ingredients_in_cauldron.append(body.name)
		num_ingredients += 1
		print("Ingredients in cauldron: ", ingredients_in_cauldron)
		body.queue_free()
