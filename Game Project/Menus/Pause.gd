extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	hide()


func close():
	get_tree().paused = false
	hide()

func open():
	show()


func _on_ResumeBtn_pressed():
	close()


func _on_ExitBtn_pressed():
	get_tree().quit()


func _on_BackToMainMenu_pressed():
	close()
	get_tree().change_scene("res://Menus/MainMenu.tscn")
