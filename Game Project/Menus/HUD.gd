extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var time := $Time as Label
onready var _pause_menu = $Pause
#onready var _all_collected = $AllCollected


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		var tree = get_tree()
		if Global.upgrade_options_close:
			tree.paused = not tree.paused
			if tree.paused:
				_pause_menu.open()
				
			else:
				_pause_menu.close()
			
			
			
func update_time(t):
	var secs = fmod(t,60)
	var mins = fmod(t,60*60)/60
	time.text = "%02d : %02d"%[mins,secs]
#	print(time.text)


	
