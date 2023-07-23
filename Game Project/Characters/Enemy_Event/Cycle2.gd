extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Tpost

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(17):
		if i>0:
			Tpost = get_node("TPost/ShrekTPost"+str(i))
			Tpost.max_hp = 2000
			Tpost.hp = 2000
			Tpost.spd = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()
