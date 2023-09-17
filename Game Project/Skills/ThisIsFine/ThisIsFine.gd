extends "res://Skills/Skill.gd"


class_name ThisIsFine, "res://Assets/Skills/this_is_fine.png"

var atk = 0
var old_Lv = 1
var now_Lv = self.level
onready var player_atk:  = get_tree().current_scene.get_node("Player").get_child(0)

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_atk  = get_tree().current_scene.get_node("Player").get_child(0)
#	print(player_atk.atk)
#	now_Lv = self.level
#	if old_Lv <= now_Lv:
#		player_atk.plus_atk = 20
#		old_Lv+=1
#	player_atk.atk = atk

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

			

