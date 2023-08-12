extends Node2D


onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)

var move_to
var angle = Vector2.ZERO


func _ready():
	$AnimationPlayer.play("Fire")
	move_to = global_position.direction_to(player.global_position)
	self.hide()

func _physics_process(delta):
	rotation = move_to.angle()
	position += move_to*2
	self.show()

func _on_Queue_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if body == null or not body.has_method("take_damage"):#มี error
		queue_free()
#		print_debug(body)
	else:
		body.take_damage(10, Vector2(0,0), 100)
		queue_free()
	


func _on_Area2D2_area_entered(area):
	queue_free()
