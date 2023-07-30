extends "res://Weapons/Weapon.gd"


class_name TwoGuitars, "res://Assets/Weapons/two_guitars/two_guitars.png"
var wave = preload("res://Weapons/weapon_new/Wave_2.tscn")

onready var wave_hitbox = $Sprite/Hitbox
onready var Loot

var rota = "r"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	Loot = get_node("../../../../Loot") 
	wave_hitbox.damage = self.atk_all
	if Input.is_action_pressed("ui_right"):
		scale.x = 1
		scale.y = 1
		rotation_degrees = 0
		rota = "r"
	elif Input.is_action_pressed("ui_left"):
		scale.x = 1
		scale.y = -1
		rotation_degrees = 180
		rota = "l"
	elif Input.is_action_pressed("ui_up"):
		scale.x = 1
		scale.y = 1
		rotation_degrees = -90
		rota = "u"
	elif Input.is_action_pressed("ui_down"):
		scale.x = 1
		scale.y = 1
		rotation_degrees = 90
		rota = "d"
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
#		scale.x = 1
#		rotation_degrees = 90
#
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
#		scale.x = -1
#		rotation_degrees = 90
#
#
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
#		scale.x = 1
#		rotation_degrees = -90
#
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
#		scale.x = -1
#		rotation_degrees = -90

func check_level():
	match level:
		1,2:
			self.atk_w += 30
			print_debug("TwoGuitars : ", level)
		3,4:
			self.atk_w += 50
			print_debug("TwoGuitars : ", level)
		5,6:
			self.atk_w += 70
			print_debug("TwoGuitars : ", level)
		7:
			self.atk_w += 90
			print_debug("TwoGuitars : ", level)


func _on_wave_att_timeout():
	var ff = get_parent()
	var waveAtt = wave.instance()
	waveAtt.position = ff.get_global_position()
	if rota == "r":
		waveAtt.scale.x = 1
		waveAtt.rotation_degrees = 0
	elif rota == "l":
		waveAtt.scale.x = -1
		waveAtt.rotation_degrees = 0
	elif rota == "u":
		waveAtt.scale.x = 1
		waveAtt.rotation_degrees = -90
	elif rota == "d":
		waveAtt.scale.x = 1
		waveAtt.rotation_degrees = 90
	Loot.call_deferred("add_child", waveAtt)
	print(get_parent().get_global_position())
