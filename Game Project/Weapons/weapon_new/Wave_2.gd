extends Node2D

onready var upposi = 5

func _ready():
	$AnimationPlayer.play("wave_attack")

func _physics_process(delta):
	if scale.x < 0 and rotation_degrees == 0:
		position.x -= upposi
	if scale.x > 0 and rotation_degrees == 0:
		position.x += upposi
	if scale.x > 0 and rotation_degrees == 90:
		position.y += upposi
	if scale.x > 0 and rotation_degrees == -90:
		position.y -= upposi
#	var two_g_node = get_parent().get_node("../Player/Doge")
#	var two_g_node = weapons_node.get_node("TwoGuitars")
#	print(two_g_node.name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()
