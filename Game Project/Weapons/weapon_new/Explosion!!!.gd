extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var atk_w 
export(int) var explosion_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Explosion!!!")
	Global.sound_Explosion = 1
	$AnimatedSprite/Area2D.damage = atk_w
	scale.x = explosion_size
	scale.y = explosion_size



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
