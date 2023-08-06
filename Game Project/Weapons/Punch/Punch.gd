extends "res://Weapons/Weapon.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Punch,"res://Assets/Weapons/punch/punch.png"
var size = 2
var L_And_R = "R"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_pressed("ui_left"):
#		scale.x = -1*size
#	if Input.is_action_pressed("ui_right"):
#		scale.x = 1*size
	if Input.is_action_pressed("ui_left"):
		L_And_R="L"
	if Input.is_action_pressed("ui_right"):
		L_And_R="R"
	scale.y = 1*size

func check_level():
	match level:
		2:
			size+=1
			self.atk_w += 60
#			print_debug("Punch : ", level)
		3,4:
			size+=1
			self.atk_w += 80
#			print_debug("Punch : ", level)
		5,6:
			size+=1
			self.atk_w += 100
#			print_debug("Punch : ", level)
		7:
			size+=1
			self.atk_w += 180
#			print_debug("Punch : ", level)


func _on_Timer_timeout():
	if L_And_R=="R":
		scale.x = 1*size
	if L_And_R=="L":
		scale.x = -1*size
	
