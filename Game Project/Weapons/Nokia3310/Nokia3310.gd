extends "res://Weapons/Weapon.gd"

class_name Nokia3310 ,"res://Assets/Weapons/indestructible_nokia_3310/Indestructible_Nokia_3310.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"/
onready var thisNode = get_node(".")
onready var ef = get_node("Sprite")
var check = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_action_pressed("ui_left"):
		scale.x = -0.2
	if Input.is_action_pressed("ui_right"):
		scale.x = 0.2


func check_level_weapon():
	match level_weapon:
		1,2:
			self.atk_w += 50
		3,4:
			self.atk_w += 80
		5,6:
			self.atk_w += 120
		7:
			self.atk_w += 180

