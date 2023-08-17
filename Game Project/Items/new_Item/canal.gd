extends Node2D

var ani_U_D_L_R 


func _ready():
	pass

func _physics_process(delta):
	if $Sprite.rotation_degrees <= 1 and $Sprite.scale.y == 1:
		ani_U_D_L_R = "D"
	if $Sprite.rotation_degrees <= 1 and $Sprite.scale.y == -1:
		ani_U_D_L_R = "U"
	if $Sprite.rotation_degrees >= 90 and $Sprite.scale.y == 1:
		ani_U_D_L_R = "L"
	if $Sprite.rotation_degrees >= 90 and $Sprite.scale.y == -1:
		ani_U_D_L_R = "R"

func _on_Timer_timeout():
	if ani_U_D_L_R == "U":
		$AnimationPlayer.play("up")
	elif ani_U_D_L_R == "D":
		$AnimationPlayer.play("down")
	elif ani_U_D_L_R == "L":
		$AnimationPlayer.play("left")
	elif ani_U_D_L_R == "R":
		$AnimationPlayer.play("right")
	else:
		$AnimationPlayer.stop()
