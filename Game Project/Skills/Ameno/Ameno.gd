extends "res://Skills/Skill.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Ameno
var pickup_radius
# Called when the node enters the scene tree for the first time.
func _ready():
	pickup_radius = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_skill:
			1,2:
				pickup_radius += 10
			3,4:
				pickup_radius += 25
			5,6:
				pickup_radius += 40
			7:
				pickup_radius += 55
