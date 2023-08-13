extends KinematicBody2D

onready var Tpost

func _ready():
	for i in range(17):
		if i>0:
			Tpost = get_node("TPost/ShrekTPost"+str(i))
			Tpost.max_hp = 2000
			Tpost.hp = 2000
			Tpost.spd = 0


func _on_Timer_timeout():
	queue_free()


