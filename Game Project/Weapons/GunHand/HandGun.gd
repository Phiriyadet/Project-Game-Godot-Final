extends "res://Weapons/Weapon.gd"

class_name HandGun, "res://Assets/Weapons/gunhand/gunhand-1.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const BULLET_SCENE: PackedScene = preload("res://Weapons/GunHand/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shoot():
	var bullet: Area2D = BULLET_SCENE.instance()
	get_tree().current_scene.add_child(bullet)

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		scale.x = -0.5
	if Input.is_action_pressed("ui_right"):
		scale.x = 0.5
		
		
