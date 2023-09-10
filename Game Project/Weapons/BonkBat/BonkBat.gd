extends Weapon

class_name BonkBat, "res://Assets/Weapons/bonk-bat/bat.png"

#onready var player := get_tree().current_scene.get_node("Player").get_child(0) as KinematicBody2D
var scaleX = 1
var bonk_size = 1
var state_attack = "right"
var old_Lv = 1
var now_Lv = self.level
func _init():
	$Node2D.visible = false

func _process(_delta):
	now_Lv = self.level
	$AnimationPlayer.stop()
	$Node2D/Sprite.hide()
	$Sprite.hide()
	if Input.is_action_pressed("ui_down"):
		state_attack = "down"
	if Input.is_action_pressed("ui_up"):
		state_attack = "up"
	if Input.is_action_pressed("ui_left"):
		state_attack = "left"
	if Input.is_action_pressed("ui_right"):
		state_attack = "right"
		
	if old_Lv < now_Lv:
		$bonk_new.scale.x += 0.2
		$bonk_new.scale.y += 0.2
		$EF_Attack.scale.x += 0.2
		$EF_Attack.scale.y += 0.2
		$bonk_new.position.x += 4
		old_Lv+=1
	
#	if Input.is_action_pressed("ui_right"):
#		scaleX = bonk_size
#		scale.x = scaleX
#		rotation_degrees = 0
#	if Input.is_action_pressed("ui_left"):
#		scaleX = bonk_size * -1
#		scale.x = scaleX
#		rotation_degrees = 0
##	if Input.is_action_pressed("ui_up"):
##		rotation_degrees = -90
##
##	if Input.is_action_pressed("ui_down"):
##		rotation_degrees = 90
#
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
##		self.look_at(Vector2.RIGHT)
#		scale.x = bonk_size
#		rotation_degrees = -90
##		rotation += rotation_speed * _delta
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
#		scale.x = bonk_size * -1
#		rotation_degrees = 90
##		self.look_at(Vector2.LEFT)
##		rotation -= rotation_speed * _delta
#
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
##		self.look_at(Vector2.RIGHT)
#		scale.x = bonk_size
#		rotation_degrees = 90
##		rotation += rotation_speed * _delta
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
#		scale.x = bonk_size * -1
#		rotation_degrees = -90
##		self.look_at(Vector2.LEFT)
##		rotation -= rotation_speed * _delta
#

func check_level():
	match level:
		2:
			self.atk_w += 40
		3,4:
			self.atk_w += 60
		5,6:
			self.atk_w += 100
		7:
			self.atk_w += 120




func _on_att_timeout():
	if state_attack == "up":
		$AnimationPlayer_new.play("Attack_up")
	elif state_attack == "down":
		$AnimationPlayer_new.play("Attack_down")
	elif state_attack == "left":
		$AnimationPlayer_new.play("Attack_left")
	elif state_attack == "right":
		$AnimationPlayer_new.play("Attack_right")




func _on_Hitbox_body_entered(body):	
	$play_audio.start()


func _on_play_audio_timeout():
	$AudioStreamPlayer2D.play()
	$Stop_audio.start()


func _on_Stop_audio_timeout():
	$AudioStreamPlayer2D.stop()
