extends Area2D

class_name Exp_gem,"res://Assets/Exp/exp_gem.png"

export(int) var experience = 100
var target = null
var speed = -60.0
onready var sound: AudioStreamPlayer2D = get_node("Effect_Collected")
onready var collision:CollisionShape2D = get_node("CollisionShape2D")
onready var time:Timer = get_node("Timer")
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
	sound.playing = true
	time.start()
	#collision.call_deferred("set","disabled", true)
	return experience

func _on_Timer_timeout():
#	print_debug("Effect Finished")
	sound.playing = false
	queue_free()

