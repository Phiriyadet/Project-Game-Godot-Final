extends Node2D
class_name Weapon
onready var player_flip = get_tree().current_scene.get_node("Player").get_child(0).get_node("animated_sprite")
onready var animated_sprite : = get_node("Node2D/Sprite")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var hitbox: Area2D = get_node("Node2D/Sprite/Hitbox")
onready var cool_down_timer: Timer = get_node("CoolDownTimer")


func _init():
	pass
func _ready():
	pass
	
func _process(delta):
	print(player_flip)
#	if player_flip == false:
#		animated_sprite.flip_h = false
#	if player_flip == true:
#		animated_sprite.flip_h = true
