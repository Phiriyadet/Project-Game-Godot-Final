extends "res://Skills/Skill.gd"


class_name Rickroll, "res://Assets/Skills/rickroll.png"

var atk
var spd
var pickup_radius
func _ready():
	atk = 0
	spd = 0
	pickup_radius = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_skill:
			1,2:
				player.atk += 40
				player.spd += 40
				player.pickup_radius += 40
			3,4:
				player.atk += 60
				player.spd += 60
				player.pickup_radius += 60
			5,6:
				player.atk += 80
				player.spd += 80
				player.pickup_radius += 80
			7:
				player.atk += 100
				player.spd += 100
				player.pickup_radius += 100
