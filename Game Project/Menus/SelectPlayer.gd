extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/HFlowContainer/Label")
onready var playBtn:Button = get_node("PlayBtn") 
# Called when the node enters the scene tree for the first time.

func _ready():
	playBtn.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackBtn_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")


func _on_PlayBtn_pressed():
	
	get_tree().change_scene("res://Maps/World.tscn")
	
	


func _on_TextureRect_pressed():
	label.text = "Dog"
	playBtn.disabled = false
	SelectPlayer.player_select = "Dog"
#	GlobalWorld.get_node("Player").add_child(Dog)


func _on_TextureRect2_pressed():
	label.text = "Monkey"
	playBtn.disabled = false
	SelectPlayer.player_select = "Monkey"
#	.0GlobalWorld.get_node("Player").add_child(Monkey)
