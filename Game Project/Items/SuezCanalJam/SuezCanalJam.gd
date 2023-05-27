extends "res://Items/Item.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name SuezCanalJam, "res://Assets/Items/evergreen.png"
onready var timer = $Timer
onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	match level_item:
#		1,2:
#			timer.wait_time += 5
#		3,4:
#			timer.wait_time += 8
#		5,6:
#			timer.wait_time += 11
#		7:
#			timer.wait_time += 14
#	print_debug("SCJ pos: ",self.global_position)
	if Input.is_action_pressed("ui_right"):
		rotation_degrees = -90
		
	if Input.is_action_pressed("ui_left"):
		rotation_degrees = 90
		
	if Input.is_action_pressed("ui_up"):
		rotation_degrees = 180

	if Input.is_action_pressed("ui_down"):
		rotation_degrees = 0
		
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
#		pass
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
#		pass
#
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
#		pass
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
#		pass
		



func _on_Timer_timeout():
	animation_player.play("work")
