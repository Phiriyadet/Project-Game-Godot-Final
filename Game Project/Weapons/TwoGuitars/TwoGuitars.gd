extends "res://Weapons/Weapon.gd"


class_name TwoGuitars, "res://Assets/Weapons/two_guitars/two_guitars.png"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		scale.x = -0.5
	if Input.is_action_pressed("ui_right"):
		scale.x = 0.5
	if Input.is_action_pressed("ui_down"): 
		scale.y = 0.5
	if Input.is_action_pressed("ui_up"): 
		scale.y = -0.5
