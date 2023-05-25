extends "res://Skills/Skill.gd"


class_name Gigachad,"res://Assets/Skills/gigachad.png"


### Automatic References Start ###
onready var _timer: Timer = $Timer

var hp
# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 0
	_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Timer_timeout():
	match level_skill:
			1,2:
				player.hp += 2
			3,4:
				player.hp += 4
			5,6:
				player.hp += 6
			7:
				player.hp += 8
