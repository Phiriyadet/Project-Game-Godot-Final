extends "res://Skills/Skill.gd"

class_name Family


var max_hp
# Called when the node enters the scene tree for the first time.
func _ready():
	max_hp = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_skill:
			1,2:
				max_hp += 20
			3,4:
				max_hp += 40
			5,6:
				max_hp += 60
			7:
				max_hp += 80
