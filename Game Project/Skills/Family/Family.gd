extends "res://Skills/Skill.gd"

class_name Family, "res://Assets/Skills/family.png"


var max_hp
# Called when the node enters the scene tree for the first time.
func _ready():
	max_hp = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_level():
	match level:
		1,2:
			player.set_maxhp(player.get_maxhp() + 20)
		3,4:
			player.set_maxhp(player.get_maxhp() + 40)
		5,6:
			player.set_maxhp(player.get_maxhp() + 60)
		7:
			player.set_maxhp(player.get_maxhp() + 80)
