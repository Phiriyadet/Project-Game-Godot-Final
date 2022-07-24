extends Node2D
class_name Weapon,"res://Assets/Weapon/bat.png"

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var hitbox: Area2D = get_node("Node2D/Sprite/Hitbox")
