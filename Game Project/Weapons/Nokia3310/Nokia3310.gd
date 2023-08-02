extends "res://Weapons/Weapon.gd"

class_name Nokia3310 ,"res://Assets/Weapons/indestructible_nokia_3310/Indestructible_Nokia_3310.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var thisNode = get_node(".")
onready var ef = get_node("Sprite")
var check = 0
var state_attack = "right"
var Ef_posi_x = 192
var Ef_posi_y = -10
var up_posi_nokia_right = 0 
var up_posi_nokia_left = 0 

var old_Lv = 1
var now_Lv = self.level
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	$AnimationPlayer.stop()
	$Node2D/Sprite.hide()
	$Sprite.hide()
	if Input.is_action_pressed("ui_left"):
		state_attack = "left"
		Ef_posi_x = -180
		Ef_posi_y = -12
	if Input.is_action_pressed("ui_right"):
		state_attack = "right"
		Ef_posi_x = 192
		Ef_posi_y = -10
		
	if old_Lv < now_Lv:
		$Nokia_new.scale.x +=0.2
		$Nokia_new.scale.y +=0.2
		up_posi_nokia_right +=10
		up_posi_nokia_left -=10
		$Ef_Attack.scale.x +=0.2
		$Ef_Attack.scale.y +=0.2
		old_Lv+=1
#	if Input.is_action_pressed("ui_left"):
#		scale.x = -1
#	if Input.is_action_pressed("ui_right"):
#		scale.x = 1
		


func check_level():
	match level:
		1,2:
			self.atk_w += 50
			print_debug("Nokia3310 : ", level)
		3,4:
			self.atk_w += 80
			print_debug("Nokia3310 : ", level)
		5,6:
			self.atk_w += 120
			print_debug("Nokia3310 : ", level)
		7:
			self.atk_w += 180
			print_debug("Nokia3310 : ", level)



func _on_att_timeout():
	if state_attack == "left":
		$Ef_Attack.position.x = Ef_posi_x + up_posi_nokia_left
		$Ef_Attack.position.y = Ef_posi_y 
		$AnimationPlayer_new.play("attack_left")
	elif state_attack == "right":
		$Ef_Attack.position.x = Ef_posi_x + up_posi_nokia_right
		$Ef_Attack.position.y = Ef_posi_y 
		$AnimationPlayer_new.play("attack_right")



