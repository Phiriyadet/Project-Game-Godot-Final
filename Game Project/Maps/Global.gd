extends Node


var player_select setget set_player, get_player
var player_status setget set_playerstatus, get_playerstatus

var player_present_status setget set_present_playerstatus, get_present_playerstatus

var enemy_dead_count = 0 
#setget set_enemyDeadCount, get_enemyDeadCount
var player_dead = false
var level_player = 1 
#setget set_playerLevel, get_playerLevel
var difficulty_level = 1
var collected_allitem 

var list_W_S = []
var countWeapon = 0
var countItem = 0

var coin_bonus_diffl = 0
var bonus_coin = 0
var bonus_exp = 0
var total_coin = 0
var total_score = 0

var num0 = 0
var num1 = 0
var countBoxs = 0
var victory = 0
var speed_pumpkin = 3

var sound_Explosion = 0
var open_chest = 0
var time_stop = 0

var gio_take_dm = 0
var selectMod = 0

var upgrade_options_close = false 

var boss_position = Vector2.ZERO

var show_hide_menu = 0

var set_level_IWS = 0

var sum_atk_skill = 0

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
	
func set_present_playerstatus(pps):
	player_present_status = pps
	
func get_present_playerstatus():
	return player_present_status
	
#func set_enemyDeadCount(edc):
#	enemy_dead_count = edc
#
#func get_enemyDeadCount():
#	return enemy_dead_count
#
#func set_playerLevel(new_pl):
#	level_player = new_pl
#
#func get_playerLevel():
#	return level_player



func game_over():
	print_debug("enemy dead:", enemy_dead_count," ","player level:", level_player)
	total_score = (enemy_dead_count * 100) + ((level_player - 1) * 2000)
	var num_coin = total_score / 1000
	var bonus1 = num_coin * bonus_coin
	var bonus2 = num_coin * coin_bonus_diffl
	total_coin = num_coin + bonus1 + bonus2

func game_Victory():
	print_debug("enemy dead:", enemy_dead_count," ","player level:", level_player)
	total_score = (enemy_dead_count * 100) + ((level_player - 1) * 2000)
	total_score += total_score*0.3
	var num_coin = total_score / 1000
	var bonus1 = num_coin * bonus_coin
	var bonus2 = num_coin * coin_bonus_diffl
	total_coin = num_coin + bonus1 + bonus2
