extends "res://Skills/Skill.gd"


class_name Gigachad,"res://Assets/Skills/gigachad.png"


### Automatic References Start ###
onready var _timer: Timer = $Timer

var hp = 2

func _ready():
	_timer.start()

func _on_Timer_timeout():
	if player != null:
		player.set_hp(player.get_hp() + hp)


func check_level():
	match level:
		1,2:
			hp += 2
		3,4:
			hp += 4
		5,6:
			hp += 6
		7:
			hp += 8
