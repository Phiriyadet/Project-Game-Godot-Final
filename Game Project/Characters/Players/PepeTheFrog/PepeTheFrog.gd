extends "res://Characters/Players/Player.gd"


class_name PepeTheFrog , "res://Assets/Characters/Players/Pepe/pepe-idle-1.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.max_hp = 50
	self.hp = 50
	self.atk = 10
	self.spd = 60
	self.pickup_radius = 20
	self.spacial_skill = false
