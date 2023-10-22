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


func _on_Timer_timeout():
	queue_free()
