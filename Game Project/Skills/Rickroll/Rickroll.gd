extends "res://Skills/Skill.gd"


class_name Rickroll, "res://Assets/Skills/rickroll.png"

var atk
var spd
var pickup_radius

var atk_sumAll

var max_hp_player
var atk_player

func _ready():
	atk = 40
	spd = 40
	pickup_radius = 40
	atk_player = get_parent().get_parent().atk
	$Up_atk.start()
	max_hp_player = get_parent().get_parent().max_hp

func _physics_process(delta):
	atk_sumAll = atk_player + atk
			
func check_level():
	if player != null:
		match level:
			2:
				atk = 40
				spd = 40
				pickup_radius = 40
			3,4:
				atk = 60
				spd = 60
				pickup_radius = 60
			5,6:
				atk = 80
				spd = 80
				pickup_radius = 80
			7:
				atk = 100
				spd = 100
				pickup_radius = 100
			
func _on_Up_atk_timeout():
	if get_parent().get_parent().hp < max_hp_player/2:
		get_parent().get_parent().atk = atk_sumAll
			
	if get_parent().get_parent().hp > max_hp_player/2:
		get_parent().get_parent().atk = atk_player

