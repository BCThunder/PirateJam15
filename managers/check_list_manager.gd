extends Node

var check_list : Dictionary = {"Poison" : {"BatWing" : 0, "Mushroom" : 1, "DragonEgg" : 2},
							   "Healing" : {"Eyeball" : 0, "Mushroom" : 1, "DragonEgg" : 2},
							   "Heat" : {"DragonEgg" : 0, "Eyeball" : 1, "BatWing" : 2}}
var is_potion_made : Array = [false, false, false]
var check_list_counter : int = 0
