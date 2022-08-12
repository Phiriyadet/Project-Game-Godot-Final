extends Node2D
class_name Weapon

onready var animated_sprite : = get_node("Node2D/Sprite")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var hitbox: Area2D = get_node("Node2D/Sprite/Hitbox")
onready var cool_down_timer: Timer = get_node("CoolDownTimer")


func _init():
	pass
func _ready():
	cool_down_timer.start()
	
func attack():
	animation_player.play("attack")
	

func _on_CoolDownTimer_timeout():
	attack()
