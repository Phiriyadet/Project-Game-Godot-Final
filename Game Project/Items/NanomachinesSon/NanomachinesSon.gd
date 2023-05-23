extends "res://Items/Item.gd"


class_name NanomachinesSon,"res://Assets/Items/hearth_nms.png"

onready var cooldown_timer = $CoolDownTimer
onready var active_timer = $ActiveTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match level_item:
		1,2:
			active_timer.wait_time = 360
		3,4:
			active_timer.wait_time = 300
		5,6:
			active_timer.wait_time = 240
		7:
			active_timer.wait_time = 180


func _on_CoolDownTimer_timeout():
	active_timer.start()
	self.visible = true


func _on_ActiveTimer_timeout():
	cooldown_timer.start()
	self.visible = false
