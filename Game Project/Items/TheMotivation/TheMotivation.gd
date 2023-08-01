extends "res://Items/Item.gd"


class_name TheMotivation, "res://Assets/Items/chair.png"

var slow = 0.0
var old_spd
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_level():
	match level:
		1,2:
			slow += 0.21
		3,4:
			slow += 0.2
		5,6:
			slow += 0.3
		7:
			slow += 0.4

func _on_Area2D_body_entered(body):
	if body != null:
		old_spd = body.get_spd()
		body.set_spd(old_spd - (old_spd * slow))
		print_debug(body,' old spd:', old_spd,' new spd:', body.get_spd())
	else:
		print_debug('Invalid body: ', body)

