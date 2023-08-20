extends "res://Characters/Players/Player.gd"


class_name TheDoge, "res://Assets/Characters/Players/Dog/dog-idle-1.png"
var doge = preload("res://Characters/Players/TheDoge/Big_Doge.tscn")

onready var spacialSkill: Node2D = $SpacialSkill
func _ready():
#	self.max_hp = 50
#	self.hp = 50
#	self.atk = 15
#	self.spd = 50
#	self.pickup_radius = 20
#	self.spacial_skill = false
	upgrade_character("BonkBat")
#	upgrade_character("TwoGuitars")
#	upgrade_character("Punch")
	upgrade_character("BonkMissile")
#	upgrade_character("NanomachinesSon")
#	upgrade_character("TakeMyMoney")
#	upgrade_character("TheMotivation")
#	upgrade_character("Amogus")
#	upgrade_character("Rickroll")
#	upgrade_character("SuezCanalJam")
	

func _process(delta):
#	print(self.atk)
	if Input.is_action_pressed("ui_left"):
		spacialSkill.scale.x = -1

	if Input.is_action_pressed("ui_right"):
		spacialSkill.scale.x = 1

#func _input(event):
#	if event is InputEventKey and event.scancode == KEY_Z and event.pressed:
#		var big_doge = doge.instance()
#		big_doge.position = position
##		add_child(big_doge)
#		get_parent().get_node("../Loot").call_deferred("add_child",big_doge)
##		print(get_parent().get_node("../Loot").name)
