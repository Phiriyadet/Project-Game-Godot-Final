extends "res://Skills/Skill.gd"


class_name ThisIsFine, "res://Assets/Skills/this_is_fine.png"

var atk
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_skill:
			1,2:
				player.atk += 20
			3,4:
				player.atk += 40
			5,6:
				player.atk += 60
			7:
				player.atk += 80
