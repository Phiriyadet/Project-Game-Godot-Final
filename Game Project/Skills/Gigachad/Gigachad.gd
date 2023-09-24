extends "res://Skills/Skill.gd"


class_name Gigachad,"res://Assets/Skills/gigachad.png"


### Automatic References Start ###
onready var _timer: Timer = $Timer

var hp = 2

var old_Lv = 1
var now_Lv = self.level
var uphp = 0

func _ready():
	_timer.start()

func _physics_process(delta):
	now_Lv = self.level
	if old_Lv <= now_Lv:
		if _timer.wait_time > 0.5:
			_timer.wait_time -= 0.1
		else:
			if uphp < 5:
				uphp+=1
			else:
				hp+=0.5
				uphp=0
		old_Lv+=1

func _on_Timer_timeout():
	if player != null:
		player.set_hp(player.get_hp() + hp)


#func check_level():
#	match level:
#		1,2:
#			hp += 2
#		3,4:
#			hp += 4
#		5,6:
#			hp += 6
#		7:
#			hp += 8
