extends "res://Items/Item.gd"


class_name Amogus,"res://Assets/Items/amogus.png"

var bonus_exp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
		

func check_level():
	match level:
		1,2:
			bonus_exp = 2
		3,4:
			bonus_exp = 3
		5,6:
			bonus_exp = 3.5
		7:
			bonus_exp = 4
	
	Global.bonus_exp = bonus_exp
