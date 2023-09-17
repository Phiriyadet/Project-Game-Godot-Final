extends "res://Skills/Skill.gd"

class_name Ameno, "res://Assets/Skills/ameno.png"
var pickup_radius 
# Called when the node enters the scene tree for the first time.
func _ready():
#	pickup_radius = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func check_level():
	if player != null:
		pass
#		match level:
#			1,2:
#				player.set_pickup(player.get_pickup() + 10)
#			3,4:
#				player.set_pickup(player.get_pickup() + 25)
#			5,6:
#				player.set_pickup(player.get_pickup() + 40)
#			7:
#				player.set_pickup(player.get_pickup() + 55)
