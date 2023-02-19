extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var fullscreen_checkbutton = $VBoxContainer/FullScreen_CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	pass
	
# Toggles fullscreen when the checkbutton is pressed
func _on_FullScreen_CheckButton_pressed():
	if fullscreen_checkbutton.pressed:
		OS.set_window_fullscreen(true)
	else:
		OS.set_window_fullscreen(false)

# Go back to main menu when back button is pressed
func _on_BackBtn_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")

# Change the volume of the "Music" bus when the Music slider is moved
func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

# Change the volume of the "Sounds" bus when the Sounds slider is moved
func _on_Sounds_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sounds"), value)
