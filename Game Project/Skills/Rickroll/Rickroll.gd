extends "res://Skills/Skill.gd"


class_name Rickroll, "res://Assets/Skills/rickroll.png"

var spd
var pickup_radius

var atk_sumAll

var max_hp_player
var atk_player

var atk = 0
var atk_old = 0
var old_Lv = 1
var now_Lv = self.level
onready var player_status:  = get_tree().current_scene.get_node("Player").get_child(0)
var process_once = 0
var att_2 = 0
#func _ready():
#	atk = 40
#	spd = 40
#	pickup_radius = 40
#	atk_player = get_parent().get_parent().atk
#	$Up_atk.start()
#	max_hp_player = get_parent().get_parent().max_hp

func _physics_process(delta):
	var now_Lv = self.level
	player_status  = get_tree().current_scene.get_node("Player").get_child(0)
	if old_Lv <= now_Lv:
		atk +=20
		if player_status.hp <= player_status.max_hp/2:
			up_status()
#		if old_Lv>1 and player_status.hp <= player_status.max_hp/2:
#			player_status.plus_atk = atk_old * -1
			
#		if player_status.hp <= player_status.max_hp/2:
#			player_status.atk += atk
#			process_once = 1
#		if player_status.hp > player_status.max_hp/2 and process_once == 1:
#			player_status.atk -= atk_old
#			process_once = 0
#		atk_old = atk
#		process_once = 0
		old_Lv+=1
		
	if player_status.hp <= player_status.max_hp/2:
		up_status()	
	
	if player_status.hp > player_status.max_hp/2:
		reduce_status()
#		if process_once == 1:
#			Global.sum_atk_skill -= atk_old
#			att_2 = 1
#			process_once = 0
#
#	elif player_status.hp <= player_status.max_hp/2 and process_once == 0:
#		if att_2 == 0:
#			Global.sum_atk_skill -= atk_old
#		Global.sum_atk_skill += atk
#		atk_old = atk
#		process_once = 1
		
#	if player_status.hp > player_status.max_hp/2 and process_once == 1:
##		print(666)
#		Global.sum_atk_skill -= atk_old 
#		process_once = 0
#func check_level():
#	if player != null:
#		match level:
#			2:
#				atk = 40
#				spd = 40
#				pickup_radius = 40
#			3,4:
#				atk = 60
#				spd = 60
#				pickup_radius = 60
#			5,6:
#				atk = 80
#				spd = 80
#				pickup_radius = 80
#			7:
#				atk = 100
#				spd = 100
#				pickup_radius = 100

func up_status():
	print("ATK = ",atk)
	print("PLAYER ATK = ",player_status.atk)
	Global.sum_atk_skill -= atk_old
	Global.sum_atk_skill += atk
	atk_old = atk

func reduce_status():
	print("ATK = ",atk)
	print("PLAYER ATK = ",player_status.atk)
	Global.sum_atk_skill -= atk_old
	atk_old=0

func _on_Up_atk_timeout():
	if get_parent().get_parent().hp < max_hp_player/2:
		get_parent().get_parent().atk = atk_sumAll

	if get_parent().get_parent().hp > max_hp_player/2:
		get_parent().get_parent().atk = atk_player

