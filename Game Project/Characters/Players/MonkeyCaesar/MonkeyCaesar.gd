extends "res://Characters/Players/Player.gd"


class_name MonkeyCaesar, "res://Assets/Characters/Players/Monkey/monkey-idle-1.png"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.max_hp = 40
	self.hp = 40
	self.atk = 20
	self.spd = 50
	self.pickup_radius = 20
	self.spacial_skill = false
	upgrade_character("TwoGuitars")
	upgrade_character("Amogus")
	upgrade_character("TheMotivation")

