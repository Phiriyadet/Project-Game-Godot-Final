extends Node2D

const PLAYER_SCENES: Dictionary = {
	"Dog":preload("res://Characters/Players/TheDoge/TheDoge.tscn"),
	"Monkey":preload("res://Characters/Players/MonkeyCaesar/MonkeyCaesar.tscn"),
	"Frog":preload("res://Characters/Players/PepeTheFrog/PepeTheFrog.tscn")
}

#onready var player := get_node("Player").get_child(0) as KinematicBody2D
var player 
onready var _pause_menu = $HUD/Pause
onready var game_over = $HUD/GameOver
onready var enemy_spawner = $Enemy_spawner
onready var p := $Player 
onready var victory = $HUD/Victory
	
func select_player(select_player):
	match select_player:
		"Doge":
			player = PLAYER_SCENES.Dog.instance()
		"Monkey":
			player = PLAYER_SCENES.Monkey.instance()
		"Frog":
			player = PLAYER_SCENES.Frog.instance()
			
func _init():
	randomize()
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	select_player(Global.player_select)
	if p != null and player != null:
		 
		# print_debug(Global.player_status.HP)
		player.max_hp = Global.player_status.HP
		player.hp = Global.player_status.HP
		player.atk = Global.player_status.ATK
		player.spd = Global.player_status.SPD
		player.pickup_radius = Global.player_status.Pickup_Radius
		player.spacial_skill = Global.player_status.Spacial_Skill
		print_debug("Global SSkill: ",Global.player_status.Spacial_Skill)
		print_debug("Player SSkill: ",player.spacial_skill)
		p.add_child(player)
		
	if p.get_child_count()>0:
		enemy_spawner.player_start(p.get_child(0))
	
#func _unhandled_input(event):
#	if event.is_action_pressed("pause"):
#		var tree = get_tree()
#		tree.paused = not tree.paused
#		if tree.paused:
#			_pause_menu.open()
#		else:
#			_pause_menu.close()
	
	
	

