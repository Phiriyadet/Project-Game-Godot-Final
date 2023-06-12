extends "res://Items/Item.gd"


class_name TakeMyMoney, "res://Assets/Items/takemymoney.png"

var bonus_coin
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_level():
	match level:
		1,2:
			bonus_coin += 0.2
		3,4:
			bonus_coin += 0.4
		5,6:
			bonus_coin += 0.6
		7:
			bonus_coin += 0.8