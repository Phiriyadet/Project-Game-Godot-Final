extends Weapon

class_name BonkBat, "res://Assets/Weapons/bonk-bat/bat.png"

#onready var player := get_tree().current_scene.get_node("Player").get_child(0) as KinematicBody2D
var scaleX = 0.5


func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		scaleX = 0.5
		scale.x = scaleX
		rotation_degrees = 0
	if Input.is_action_pressed("ui_left"):
		scaleX = -0.5
		scale.x = scaleX
		rotation_degrees = 0
#	if Input.is_action_pressed("ui_up"):
#		rotation_degrees = -90
#
#	if Input.is_action_pressed("ui_down"):
#		rotation_degrees = 90
		
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
#		self.look_at(Vector2.RIGHT)
		scale.x = 0.5
		rotation_degrees = -90
#		rotation += rotation_speed * _delta


	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
		scale.x = -0.5
		rotation_degrees = 90
#		self.look_at(Vector2.LEFT)
#		rotation -= rotation_speed * _delta

	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
#		self.look_at(Vector2.RIGHT)
		scale.x = 0.5
		rotation_degrees = 90
#		rotation += rotation_speed * _delta


	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
		scale.x = -0.5
		rotation_degrees = -90
#		self.look_at(Vector2.LEFT)
#		rotation -= rotation_speed * _delta
		




