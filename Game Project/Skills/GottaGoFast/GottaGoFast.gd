extends "res://Skills/Skill.gd"

class_name GottaGoFast,"res://Assets/Skills/gotta_go_fast.png"

var spd
func _ready():
	spd = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_skill:
			1,2:
				player.spd += 20
			3,4:
				player.spd += 40
			5,6:
				player.spd += 60
			7:
				player.spd += 80
