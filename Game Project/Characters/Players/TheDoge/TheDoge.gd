extends "res://Characters/Players/Player.gd"


class_name TheDoge, "res://Assets/Characters/Players/Dog/dog-idle-1.png"

func _ready():
	self.max_hp = 50
	self.hp = 50
	self.atk = 15
	self.spd = 50
	self.pickup_radius = 20
	self.spacial_skill = false
