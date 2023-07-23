extends Node


var player_select setget set_player, get_player
var player_status setget set_playerstatus, get_playerstatus
var enemy_dead_count = 0
var player_dead = false
var level_player = 1
var difficulty_level = 1
var coin_bonus = 0
var collected_allitem 


var num0 = 0
var num1 = 0
var countBoxs = 0
var victory = 0

var gio_take_dm = 0

var boss_position = Vector2.ZERO

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

