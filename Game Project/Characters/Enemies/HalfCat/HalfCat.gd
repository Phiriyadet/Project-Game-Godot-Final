extends "res://Characters/Enemies/Enemy.gd"

class_name HalfCat ,"res://Assets/Characters/Enemies/Half_cat/halfiecat-1.png"


func _process(_delta: float):
	hitbox.knockback_direction = velocity.normalized()
