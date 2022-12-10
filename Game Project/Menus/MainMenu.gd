extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartBtn_pressed():
	get_tree().change_scene("res://Menus/SelectPlayerMenu.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()


func _on_CreditsBtn_pressed():
	get_tree().change_scene("res://Menus/Credits.tscn")


func _on_SettingBtn_pressed():
	get_tree().change_scene("res://Menus/Settings.tscn")
