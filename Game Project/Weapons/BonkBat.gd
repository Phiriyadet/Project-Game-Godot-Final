extends Weapon

class_name BonkBat, "res://Assets/Weapon/bat.png"

#onready var player := get_tree().current_scene.get_node("Player").get_child(0) as KinematicBody2D


# Called when the node enters the scene tree for the first time.

	
func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		scale.x = -0.5
	if Input.is_action_pressed("ui_right"):
		scale.x = 0.5
			


