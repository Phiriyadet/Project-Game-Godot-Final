extends "res://Characters/Players/Player.gd"


class_name TheDoge, "res://Assets/Characters/Players/Dog/dog-idle-1.png"

onready var spacialSkill: Node2D = $SpacialSkill
func _ready():
	self.max_hp = 50
	self.hp = 50
	self.atk = 15
	self.spd = 500
	self.pickup_radius = 20
	self.spacial_skill = false

func _process(delta):
		
	if Input.is_action_pressed("ui_left"):
		spacialSkill.scale.x = -1

	if Input.is_action_pressed("ui_right"):
		spacialSkill.scale.x = 1
