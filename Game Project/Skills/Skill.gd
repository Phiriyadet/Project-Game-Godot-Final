extends Node2D

class_name Skill

onready var player: Player = get_tree().current_scene.get_node("Player").get_child(0) as Player

export(int) var level = 1 setget set_newlevel, get_level

# Called when the node enters the scene tree for the first time.
func _ready():
	check_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_newlevel(level:int):
	level = clamp(level+1,1,7)
	check_level()
	
func get_level() -> int:
	return level
	
func check_level():
	if player != null:
		match level:
			1,2:
				print_debug("skill level :", level)
			3,4:
				print_debug("skill level :", level)
			5,6:
				print_debug("skill level :", level)
			7:
				print_debug("skill level :", level)

