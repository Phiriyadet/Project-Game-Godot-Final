extends "res://Skills/Skill.gd"


class_name Gigachad,"res://Assets/Skills/gigachad.png"


### Automatic References Start ###
onready var _timer: Timer = $Timer

var hp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
