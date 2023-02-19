extends Control


onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label")

onready var playBtn:Button = get_node("PlayBtn") 


# Called when the node enters the scene tree for the first time.
func _ready():
	# disable play button when the scene is loaded
	playBtn.disabled = true
	# set global variable enemy_dead_count to 0
	Global.enemy_dead_count = 0

# called when the Back button is pressed
func _on_BackBtn_pressed():
	# change to main menu scene
	get_tree().change_scene("res://Menus/MainMenu.tscn")

# called when the Play button is pressed
func _on_PlayBtn_pressed():
	# change to world map scene
	get_tree().change_scene("res://Maps/World.tscn")

# called when the TextureRect is pressed
func _on_TextureRect_pressed():
	# set label text to "Dog"
	label.text = "Dog"
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Dog"
	Global.player_select = "Dog"

# called when the TextureRect2 is pressed
func _on_TextureRect2_pressed():
	# set label text to "Monkey"
	label.text = "Monkey"
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Monkey"
	Global.player_select = "Monkey"

# called when the TextureRect3 is pressed
func _on_TextureRect3_pressed():
	# set label text to "Frog"
	label.text = "Frog"
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Frog"
	Global.player_select = "Frog"
