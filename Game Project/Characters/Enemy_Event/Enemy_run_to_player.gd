extends KinematicBody2D

onready var Cock
onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)
var move_to

func _ready():
	move_to = global_position.direction_to(player.global_position)
	for i in range(21):
		if i>0:
			Cock = get_node("Cockroach/Cockroach"+str(i))
			Cock.atk = 1
			Cock.spd = 0.1

func _physics_process(delta):
	position+=move_to*2


func _on_Timer_timeout():
	queue_free()
