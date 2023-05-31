extends "res://Weapons/Weapon.gd"


class_name TwoGuitars, "res://Assets/Weapons/two_guitars/two_guitars.png"


var scaleX = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		scaleX = 0.5
		scale.x = scaleX
		rotation_degrees = 0
	if Input.is_action_pressed("ui_left"):
		scaleX = -0.5
		scale.x = scaleX
		rotation_degrees = 0
		
	if Input.is_action_pressed("ui_up"):
		scale.x = scaleX
		rotation_degrees = -90

	if Input.is_action_pressed("ui_down"):
		scale.x = scaleX
		rotation_degrees = 90

	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
		scale.x = 0.5
		rotation_degrees = -90



	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
		scale.x = -0.5
		rotation_degrees = 90


	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
		scale.x = 0.5
		rotation_degrees = 90



	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
		scale.x = -0.5
		rotation_degrees = -90

func check_level_weapon():
	match level_weapon:
		1,2:
			self.atk_w += 30
		3,4:
			self.atk_w += 50
		5,6:
			self.atk_w += 70
		7:
			self.atk_w += 90
