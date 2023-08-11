extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var status = "I"

func _physics_process(delta):
	if status == "I":
		$AnimationPlayer.play("Idle")
	else:
		$AnimationPlayer.play("open")


func _on_Area2D_body_entered(body):
	status = "O"
	$Timer2.start()


func _on_Timer2_timeout():
	Global.open_chest = 1
