extends "res://Items/Item.gd"


class_name SuezCanalJam, "res://Assets/Items/evergreen.png"
onready var timer = $Timer
onready var animation_player = $AnimationPlayer

var spwn = preload("res://Items/new_Item/canal.tscn")
var check_move = "L"
var canal_size = 0
var old_Lv = 1
var now_Lv = self.level

func _process(delta):
	now_Lv = self.level
	if old_Lv < now_Lv:
		canal_size += 0.2
		old_Lv+=1
		
	if Input.is_action_pressed("ui_right"):
		check_move = "L"
		
	elif Input.is_action_pressed("ui_left"):
		check_move = "R"
		
	elif Input.is_action_pressed("ui_up"):
		check_move = "D"

	elif Input.is_action_pressed("ui_down"):
		check_move = "U"

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

func _on_Timer2_timeout():
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
	elif check_move == "U":
		canal.get_node("Sprite").scale.y = -1
		canal.get_node("Sprite").rotation_degrees = 0

	elif check_move == "D":
		canal.get_node("Sprite").scale.y = 1
		canal.get_node("Sprite").rotation_degrees = 0

	get_node("../../../../Loot").call_deferred("add_child",canal)
