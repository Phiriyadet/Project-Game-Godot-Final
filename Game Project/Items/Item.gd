extends Node2D


class_name Item

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)

export(int) var level_item = 1 setget set_newlevel_item

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_newlevel_item(level_item:int):
	level_item = clamp(level_item+1, 1, 7)
