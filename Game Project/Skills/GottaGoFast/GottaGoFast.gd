extends "res://Skills/Skill.gd"

class_name GottaGoFast,"res://Assets/Skills/gotta_go_fast.png"

var spd
func _ready():
	spd = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_level():
	if player != null:
		match level:
			1,2:
				player.set_spd(player.get_spd() + 20)
			3,4:
				player.set_spd(player.get_spd() + 40)
			5,6:
				player.set_spd(player.get_spd() + 60)
			7:
				player.set_spd(player.get_spd() + 80)
		
