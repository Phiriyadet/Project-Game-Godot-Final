extends "res://Items/Item.gd"


class_name TheMotivation, "res://Assets/Items/chair.png"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	#check group of body
	if body.is_in_group("enemy"):
		body.spd = 10
		print_debug(body.spd)
