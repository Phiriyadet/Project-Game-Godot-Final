extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ani_U_D_L_R 

# Called when the node enters the scene tree for the first time.
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
#	print($Sprite.rotation_degrees)
#	print($Sprite.scale.y)
#	print(ani_U_D_L_R)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
