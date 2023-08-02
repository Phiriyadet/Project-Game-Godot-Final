extends "res://Items/Item.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name SuezCanalJam, "res://Assets/Items/evergreen.png"
onready var timer = $Timer
onready var animation_player = $AnimationPlayer

var spwn = preload("res://Items/new_Item/canal.tscn")
var check_move = "L"
var canal_size = 0
var old_Lv = 1
var now_Lv = self.level
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	now_Lv = self.level
	if old_Lv < now_Lv:
		canal_size += 0.2
		old_Lv+=1
#	print(self.level)
#	match level:
#		1,2:
#			timer.wait_time += 5
#		3,4:
#			timer.wait_time += 8
#		5,6:
#			timer.wait_time += 11
#		7:
#			timer.wait_time += 14
#	print_debug("SCJ pos: ",self.global_position)
	if Input.is_action_pressed("ui_right"):
		check_move = "L"
		
	elif Input.is_action_pressed("ui_left"):
		check_move = "R"
		
	elif Input.is_action_pressed("ui_up"):
		check_move = "D"

	elif Input.is_action_pressed("ui_down"):
		check_move = "U"
		
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
#		pass
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
#		pass
#
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
#		pass
#
#
#	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
#		pass
		
func check_level():
#	pass
	match level:
		2:
			$Timer2.wait_time-= 0.5
		3,4:
			$Timer2.wait_time-= 0.5
		5,6:
			$Timer2.wait_time-= 0.5
		7:
			$Timer2.wait_time-= 0.5

func _on_Timer_timeout():
#	animation_player.play("work")
#	self.level +=0.5
	pass


func _on_Timer2_timeout():
#	animation_player.play("work")
#	self.level +=0.5
	var canal = spwn.instance()
	canal.position = get_parent().get_parent().get_position()
	canal.scale.x += canal_size
	canal.scale.y += canal_size
	if check_move == "R":
		canal.get_node("Sprite").scale.y = -1
		canal.get_node("Sprite").rotation_degrees = 90
		
	elif check_move == "L":
		canal.get_node("Sprite").scale.y = 1
		canal.get_node("Sprite").rotation_degrees = 90
		print(check_move)
	elif check_move == "U":
		canal.get_node("Sprite").scale.y = -1
		canal.get_node("Sprite").rotation_degrees = 0

	elif check_move == "D":
		canal.get_node("Sprite").scale.y = 1
		canal.get_node("Sprite").rotation_degrees = 0
		
#	print(check_move)
#	add_child(canal)
	get_node("../../../../Loot").call_deferred("add_child",canal)
