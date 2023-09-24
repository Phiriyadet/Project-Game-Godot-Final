extends "res://Skills/Skill.gd"

class_name GottaGoFast,"res://Assets/Skills/gotta_go_fast.png"

var old_Lv = 1
var now_Lv = self.level


func _physics_process(delta):
	now_Lv = self.level
	if old_Lv <= now_Lv:
		player.spd += 5
		old_Lv+=1
# Called every frame. 'delta' is the elapsed time since the previous frame.

#func check_level():
#	if player != null:
#		match level:
#			1,2:
#				player.set_spd(player.get_spd() + 20)
#			3,4:
#				player.set_spd(player.get_spd() + 40)
#			5,6:
#				player.set_spd(player.get_spd() + 60)
#			7:
#				player.set_spd(player.get_spd() + 80)
#


