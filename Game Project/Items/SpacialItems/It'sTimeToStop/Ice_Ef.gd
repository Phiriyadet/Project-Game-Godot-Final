extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var valum = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Ice")
	$AudioStreamPlayer2D.playing
	$AudioStreamPlayer2D.volume_db = 30

func _physics_process(delta):
	print($AudioStreamPlayer2D.volume_db)
	if $AudioStreamPlayer2D.volume_db >50 or valum == 1:
		$AudioStreamPlayer2D.volume_db -=1
		valum = 1
	else:
		$AudioStreamPlayer2D.volume_db += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
