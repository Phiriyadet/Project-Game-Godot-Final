extends Node


var player_select setget set_player, get_player
var player_status setget set_playerstatus, get_playerstatus
var enemy_dead_count = 0
var player_dead = false
var level_player = 1

var level_bonkbat = 0 setget set_levelbonkbat, get_levelbonkbat
var level_bonkmissile = 0 
var level_gunhand = 0 
var level_nokia3310 = 0
var level_punch = 0
var level_twoguitars = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_player(p):
	player_select = p
	
func get_player():
	return player_select

func set_playerstatus(ps):
	player_status = ps
	
func get_playerstatus():
	return player_status

func set_levelbonkbat(new_level):
	level_bonkbat = clamp(new_level, 1, 7)
	
func get_levelbonkbat():
	return level_bonkbat
