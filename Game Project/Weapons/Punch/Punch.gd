extends "res://Weapons/Weapon.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Punch,"res://Assets/Weapons/punch/punch.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		scale.x = -1
	if Input.is_action_pressed("ui_right"):
		scale.x = 1
