extends Enemy
class_name shrek,"res://Assets/Shrek-t-post/shrek-t-pose.png"

onready var hitbox: Area2D = get_node("Hitbox")


func _process(_delta: float):
	hitbox.knockback_direction = velocity.normalized()

