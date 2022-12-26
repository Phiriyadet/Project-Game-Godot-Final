extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	hide()


func close():
	get_tree().paused = false
