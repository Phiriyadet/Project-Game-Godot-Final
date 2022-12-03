extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var fullscreen_checkbutton = $VBoxContainer/FullScreen_CheckButton
onready var music = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	pass
	
func _on_FullScreen_CheckButton_pressed():
	if fullscreen_checkbutton.pressed == true:
		
		OS.set_window_fullscreen(true)
	else:
		OS.set_window_fullscreen(false)
#		OS.set_window_resizable(true)
