extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_select setget set_player, get_player
var enemy_dead_count = 0
var player_dead = false
var level_player = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_player(p):
	player_select = p
	
func get_player():
	return player_select
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
