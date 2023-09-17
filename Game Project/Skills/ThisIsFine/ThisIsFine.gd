extends "res://Skills/Skill.gd"


class_name ThisIsFine, "res://Assets/Skills/this_is_fine.png"

var atk = 0
var old_Lv = 1
var now_Lv = self.level

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	print(player_atk.atk)
	now_Lv = self.level
	if old_Lv <= now_Lv:
		atk += 20
		Global.sum_atk_skill +=20
		old_Lv+=1
	

#func check_level():
#	match level:
#		2:
#			atk=20
##			player2.set_atk(player2.atk + 20)
#		3,4:
#			atk=40
##			player2.set_atk(player2.atk + 40)
#		5,6:
#			atk=60
##			player2.set_atk(player2.atk + 60)
#		7:
#			atk=80
#			player2.set_atk(player2.atk + 80)

			

