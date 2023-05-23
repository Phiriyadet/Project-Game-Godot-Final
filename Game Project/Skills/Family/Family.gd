extends "res://Skills/Skill.gd"

class_name Family, "res://Assets/Skills/family.png"


var max_hp
# Called when the node enters the scene tree for the first time.
func _ready():
	max_hp = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_skill:
			1,2:
				player.max_hp += 20
			3,4:
				player.max_hp += 40
			5,6:
				player.max_hp += 60
			7:
				player.max_hp += 80
