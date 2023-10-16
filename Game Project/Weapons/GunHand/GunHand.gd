extends "res://Weapons/Weapon.gd"

class_name GunHand, "res://Assets/Weapons/gunhand/gunhand-1.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const BULLET_SCENE: PackedScene = preload("res://Weapons/GunHand/Bullet.tscn")
var side = 400.0
onready var spos = $Node2D/Anchor/SpawnBulletPosition2D
var speed_bullet = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shoot():
	var bullet: Area2D = BULLET_SCENE.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.launch(spos.global_position, Vector2(side,0), 1+speed_bullet, self.atk_all)
	

func _process(_delta):
	
	if Input.is_action_pressed("ui_left"):
		scale.x = -1
#		spos.position.x = 120
#		spos.rotation_degrees = 180
		side = -400.0
		
	if Input.is_action_pressed("ui_right"):
		scale.x = 1
#		spos.position.x = 120
#		spos.rotation_degrees = 0
		side = 400.0
func _physics_process(delta):
	$AnimationPlayer.stop()
	
	
func check_level():
	match level:
		2:
			self.atk_w += 25
			$Timer.wait_time-=0.2
			speed_bullet+=1
#			print_debug("GunHand : ", level)
		3,4:
			self.atk_w += 35
			$Timer.wait_time-=0.2
			speed_bullet+=1
#			print_debug("GunHand : ", level)
		5,6:
			self.atk_w += 45
			$Timer.wait_time-=0.2
			speed_bullet+=1
#			print_debug("GunHand : ", level)
		7:
			self.atk_w += 55
			$Timer.wait_time=0.25
			speed_bullet+=1
#			print_debug("GunHand : ", level)	
		
		


func _on_Timer_timeout():
	shoot()
	$AudioStreamPlayer2D.play()
	$Timer2.start()


func _on_Timer2_timeout():
	$AudioStreamPlayer2D.stop()
