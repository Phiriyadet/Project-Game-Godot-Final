extends Node2D

const ENEMY_SCENES: Dictionary = { 
	"CursedCat":preload("res://Characters/Enemies/CursedCat/CursedCat.tscn"),
	"HalfCat":preload("res://Characters/Enemies/HalfCat/HalfCat.tscn")
}
const PLAYER_SCENES: Dictionary = {
	"Dog":preload("res://Characters/Players/TheDog/TheDog.tscn"),
	"Monkey":preload("res://Characters/Players/MonkeyCaesar/MonkeyCaesar.tscn"),
	"Frog":preload("res://Characters/Players/PepeTheFrog/PepeTheFrog.tscn")
}
#const ENEMY_SPAWNS: Dictionary={
#	0:{"time_start":0,"time_end":5,"enemy":ENEMY_SCENES.CursedCat,
#	"enemy_number":1,"enemy_spawn_delay":0,"spawn_delay_counter" : 0},
#	1:{"time_start":10,"time_end":20,"enemy":ENEMY_SCENES.HalfCat,
#	"enemy_number":5,"enemy_spawn_delay":0,"spawn_delay_counter" : 0},
#}
const ENEMY_SPAWNS: Dictionary={
	0:{"time_start":0,"time_end":5,"enemy":ENEMY_SCENES.CursedCat,
	"enemy_number":2,"enemy_spawn_delay":0,"spawn_delay_counter" : 0},
		1:{"time_start":10,"time_end":15,"enemy":ENEMY_SCENES.CursedCat,
	"enemy_number":3,"enemy_spawn_delay":0,"spawn_delay_counter" : 3},
	
}
#onready var player := get_node("Player").get_child(0) as KinematicBody2D
var player 
onready var HUD := $HUD as CanvasLayer
onready var count_time := $CountTime as Timer 
onready var _pause_menu = $HUD/Pause
onready var game_over = $HUD/GameOver

onready var nav := $Area
onready var p := $Player 
onready var enemy_group := $EnemyGroup
# Declare member variables here. Examples:
var time = 0
var enemy :KinematicBody2D
var player_in_map : KinematicBody2D

	
func select_player(select_player):
	match select_player:
		"Dog":
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
		p.add_child(player)
		
	if p.get_child_count()>0:
		player_in_map = p.get_child(0)
		count_time.start()	

#func _unhandled_input(event):
#	if event.is_action_pressed("pause"):
#		var tree = get_tree()
#		tree.paused = not tree.paused
#		if tree.paused:
#			_pause_menu.open()
#		else:
#			_pause_menu.close()
	
func _on_CountTime_timeout():
	time += 1
	HUD.update_time(time)
#	if randi() % 2 == 0:
#		enemy = ENEMY_SCENES.HalfCat.instance()
#	else:
#		enemy = ENEMY_SCENES.CursedCat.instance()
#	print(ENEMY_SPAWNS)
#	for i in ENEMY_SPAWNS:
##		print(i)
#		if time >= ENEMY_SPAWNS[i]["time_start"] and time <= ENEMY_SPAWNS[i]["time_end"]:
##			if ENEMY_SPAWNS[i]["spawn_delay_counter"] < ENEMY_SPAWNS[i]["enemy_spawn_delay"]:
##				ENEMY_SPAWNS[i]["spawn_delay_counter"] += 1
##			else:
##				ENEMY_SPAWNS[i]["spawn_delay_counter"] = 0
#
#				var counter = 0
#				while counter < ENEMY_SPAWNS[i]["enemy_number"]:
#					var enemy_spawn = ENEMY_SPAWNS[i]["enemy"].instance()
#					enemy_spawn.position = player_in_map.position + Vector2(500,0).rotated(rand_range(0,2*PI))
#					enemy_group.call_deferred("add_child", enemy_spawn)
#					counter += 1
##
	enemy = ENEMY_SCENES.CursedCat.instance()
	enemy.position = player_in_map.position + Vector2(500,100).rotated(rand_range(0,2*PI))
	nav.call_deferred("add_child", enemy)
	
	

