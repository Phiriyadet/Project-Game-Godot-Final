extends "res://Items/Item.gd"


class_name TheMotivation, "res://Assets/Items/chair.png"

var slow
var old_spd
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_item:
		1,2:
			slow += 0.1
		3,4:
			slow += 0.2
		5,6:
			slow += 0.3
		7:
			slow += 0.4


func _on_Area2D_body_entered(body):
	#check group of body
	old_spd = body.spd
	body.spd = body.spd-(body.spd*slow)
	print_debug('in body: ',body.spd)
