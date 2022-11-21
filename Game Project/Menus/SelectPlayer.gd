extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Dog = preload("res://Characters/Players/TheDog/TheDog.tscn")
onready var Monkey = preload("res://Characters/Players/MonkeyCaesar/MonkeyCaesar.tscn")

onready var map = preload("res://Maps/World.gd")

onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/HFlowContainer/Label")
onready var playBtn:Button = get_node("PlayBtn") 
# Called when the node enters the scene tree for the first time.
var player_select
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
	player_select= Dog
	print_debug(map)
#	GlobalWorld.get_node("Player").add_child(Dog)


func _on_TextureRect2_pressed():
	label.text = "Monkey"
	playBtn.disabled = false
	player_select=Monkey
#	.0GlobalWorld.get_node("Player").add_child(Monkey)
