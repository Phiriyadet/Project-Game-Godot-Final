extends "res://Items/Item.gd"


class_name Amogus,"res://Assets/Items/amogus.png"

var bonus_exp
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	match level_item:
		1,2:
			bonus_exp += 20
		3,4:
			bonus_exp += 40
		5,6:
			bonus_exp += 60
		7:
			bonus_exp += 80

