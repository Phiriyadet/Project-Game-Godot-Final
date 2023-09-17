extends "res://Skills/Skill.gd"


class_name Rickroll, "res://Assets/Skills/rickroll.png"

var spd = 0
var spd_old = 0
var pr = 0
var pr_old = 0

var atk = 0
var atk_old = 0
var old_Lv = 1
var now_Lv = self.level
onready var player_status:  = get_tree().current_scene.get_node("Player").get_child(0)

func _physics_process(delta):
	var now_Lv = self.level
	player_status  = get_tree().current_scene.get_node("Player").get_child(0)
	if old_Lv <= now_Lv:
		atk += 10
		spd += 5
		pr += 2
		if player_status.hp <= player_status.max_hp/2:
			up_status()
		old_Lv+=1
		
	if player_status.hp <= player_status.max_hp/2:
		up_status()	
	
	if player_status.hp > player_status.max_hp/2:
		reduce_status()


func up_status():
#	print("ATK = ",atk)
#	print("PLAYER ATK = ",player_status.atk)
	player_status.spd -= spd_old
	player_status.spd += spd
	
	player_status.pickup_radius -= pr_old
	player_status.pickup_radius += pr
	
	Global.sum_atk_skill -= atk_old
	Global.sum_atk_skill += atk
	
	atk_old = atk
	spd_old = spd
	pr_old = pr
	

func reduce_status():
#	print("ATK = ",atk)
#	print("PLAYER ATK = ",player_status.atk)
	Global.sum_atk_skill -= atk_old
	player_status.spd -= spd_old
	player_status.pickup_radius -= pr_old
	
	atk_old=0
	spd_old=0
	pr_old=0


