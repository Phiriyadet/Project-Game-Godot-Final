extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label")
onready var label2: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label2")
onready var label3: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label3")
onready var label4: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label4")
onready var label5: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label5")
onready var label6: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer2/HBoxContainer5/Label6")

onready var Line_Edit: LineEdit = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/HFlowContainer/LineEdit")

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
	label2.text = "ATK" 
	label3.text = "HP" 
	label4.text = "SPD" 
	label5.text = "Pickup Radius" 
	label6.text = "Special Skill" 
	label6.text = "Special Skill" 
	playBtn.disabled = false
	SelectPlayer.player_select = "Dog"
#	GlobalWorld.get_node("Player").add_child(Dog)


func _on_TextureRect2_pressed():
	label.text = "Monkey"
	label2.text = "ATK" 
	label3.text = "HP" 
	label4.text = "SPD" 
	label5.text = "Pickup Radius" 
	label6.text = "Special Skill"
	playBtn.disabled = false
	SelectPlayer.player_select = "Monkey"
#	.0GlobalWorld.get_node("Player").add_child(Monkey)


func _on_TextureRect3_pressed():
	label.text = "Frog"
	label2.text = "ATK" 
	label3.text = "HP" 
	label4.text = "SPD" 
	label5.text = "Pickup Radius" 
	label6.text = "Special Skill" 
	playBtn.disabled = false
	SelectPlayer.player_select = "Frog"
