extends "res://Characters/Enemies/Enemy.gd"

class_name CursedCat ,"res://Assets/Characters/Enemies/Cursed_cat/cursed_cat-idle-1.png"


func _process(_delta: float):
	hitbox.knockback_direction = velocity.normalized()


