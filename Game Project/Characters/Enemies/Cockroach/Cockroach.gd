extends "res://Characters/Enemies/Enemy.gd"

class_name Cockroach, "res://Assets/Characters/Enemies/Cockroach_dancing/cockroach-1.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta: float):
	hitbox.knockback_direction = velocity.normalized()
	if Global.gio_take_dm == 1:
		self.take_damage(2000, Vector2.ZERO, 0)
