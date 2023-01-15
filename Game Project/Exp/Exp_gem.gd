extends Area2D

class_name Exp_gem,"res://Assets/Exp/exp_gem.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var experience = 1
var target = null
var speed = -60.0
onready var sound: AudioStreamPlayer2D = get_node("Effect_Collected")
onready var collision:CollisionShape2D = get_node("CollisionShape2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, delta*speed)
		speed += 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func grab():
	sound.play()
	collision.call_deferred("set","disabled", true)
	return experience


func _on_Effect_Collected_finished():
	pass # Replace with function body.
