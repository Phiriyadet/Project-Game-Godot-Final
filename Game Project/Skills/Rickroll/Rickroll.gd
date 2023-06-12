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
	pass

func check_level():
	match level:
		1,2:
			player.set_atk(player.get_atk() + 40)
			player.set_spd(player.get_spd() + 40)
			player.set_pickup(player.get_pickup() + 40)
		3,4:
			player.set_atk(player.get_atk() + 60)
			player.set_spd(player.get_spd() + 60)
			player.set_pickup(player.get_pickup() + 60)
		5,6:
			player.set_atk(player.get_atk() + 80)
			player.set_spd(player.get_spd() + 80)
			player.set_pickup(player.get_pickup() + 80)
		7:
			player.set_atk(player.get_atk() + 100)
			player.set_spd(player.get_spd() + 100)
			player.set_pickup(player.get_pickup() + 100)
			