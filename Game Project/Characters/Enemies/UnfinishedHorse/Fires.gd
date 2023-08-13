extends Area2D

func _ready():
	$AnimationPlayer.play("Fires")

func _physics_process(delta):
	pass

func _on_Queue_timeout():
	queue_free()

func _on_Fires_body_entered(body):
	if body == null or not body.has_method("take_damage"):#มี error
		pass
	else:
		body.take_damage(10, Vector2(0,0), 100)

