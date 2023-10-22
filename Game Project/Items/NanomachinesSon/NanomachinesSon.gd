extends "res://Items/Item.gd"

class_name NanomachinesSon, "res://Assets/Items/hearth_nms.png"

onready var cooldown_timer = $CoolDownTimer as Timer
onready var active_timer = $ActiveTimer as Timer 

var wait_time 

# Called when the node enters the scene tree for the first time.
func _ready():
#	player.check_can_take_damage = false
#	player.animated_sprite.modulate = Color(0, 0, 0, 1)
	check_level() # Call check_level() to set the initial wait_time
	start_cooldown() # Start the cooldown timer initially

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_level():
	match level:
		1, 2:
			wait_time = 36.0
		3, 4:
			wait_time = 30.0
		5, 6:
			wait_time = 24.0
		7:
			wait_time = 18.0

func start_cooldown():
	cooldown_timer.wait_time = wait_time
	cooldown_timer.start()

func _on_CoolDownTimer_timeout():
	active_timer.start()
	player.check_can_take_damage = false
	player.animated_sprite.modulate = Color(0, 0, 0, 1)

func _on_ActiveTimer_timeout():
	start_cooldown()
	player.check_can_take_damage = true
	player.animated_sprite.modulate = Color(1, 1, 1, 1)

