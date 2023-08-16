extends "res://Skills/Skill.gd"


class_name Rickroll, "res://Assets/Skills/rickroll.png"

var atk
var spd
var pickup_radius
var swift = 0
var max_hp_player
func _ready():
	atk = 40
	spd = 40
	pickup_radius = 40

func _physics_process(delta):
	if player != null:
		max_hp_player = get_parent().get_parent().max_hp
		if get_parent().get_parent().hp>0 and swift == 0:
			get_parent().get_parent().hp-=1
			if get_parent().get_parent().hp < max_hp_player/2:
				get_parent().get_parent().atk += atk
		else:
			swift = 1
		if get_parent().get_parent().hp<50 and swift == 1:
			get_parent().get_parent().hp+=1
			if get_parent().get_parent().hp > max_hp_player/2:
				get_parent().get_parent().atk -= atk
		else:
			swift = 0
			
			

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
			


func _on_Timer_timeout():
	print("My Level: ",self.level)
	if self.level<7:
		self.level+=0.5
