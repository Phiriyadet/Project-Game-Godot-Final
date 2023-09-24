extends "res://Skills/Skill.gd"

class_name Family, "res://Assets/Skills/family.png"


var max_hp = 10
var old_Lv = 1
var now_Lv = self.level
onready var player_status:  = get_tree().current_scene.get_node("Player").get_child(0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_status  = get_tree().current_scene.get_node("Player").get_child(0)
	now_Lv = self.level
	if old_Lv <= now_Lv:
		player_status.max_hp += max_hp
		old_Lv+=1

#func check_level():
#	if player != null:
#		match level:
#			1,2:
#				player.set_maxhp(player.get_maxhp() + 20)
#			3,4:
#				player.set_maxhp(player.get_maxhp() + 40)
#			5,6:
#				player.set_maxhp(player.get_maxhp() + 60)
#			7:
#				player.set_maxhp(player.get_maxhp() + 80)

