extends Node2D

const ENEMY_SCENES: Dictionary = { 
	"CursedCat":preload("res://Characters/Enemies/CursedCat/CursedCat.tscn"),
	"HalfCat":preload("res://Characters/Enemies/HalfCat/HalfCat.tscn")
}
const PLAYER_SCENES: Dictionary = {
	"Dog":preload("res://Characters/Players/TheDog/TheDog.tscn"),
	"Monkey":preload("res://Characters/Players/MonkeyCaesar/MonkeyCaesar.tscn")
}
 
#onready var player := get_node("Player").get_child(0) as KinematicBody2D
var player 
onready var HUD := $HUD as CanvasLayer
onready var count_time := $HUD/CountTime as Timer 
onready var nav := $Areas/Area
onready var p := $Player 
# Declare member variables here. Examples:
var t = 0
var enemy :KinematicBody2D
var player_in_map : KinematicBody2D

	
func select_player(select_player):
	if select_player == "Dog":
		player = PLAYER_SCENES.Dog.instance()
	if select_player == "Monkey":
		player = PLAYER_SCENES.Monkey.instance()
	
func _init():
	randomize()
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	select_player(SelectPlayer.player_select)
	if p != null and player != null:
		p.add_child(player)
		
	if p.get_child_count()>0:
		player_in_map = p.get_child(0)
		count_time.start()	
		
func _on_CountTime_timeout():
	t += 1
	HUD.update_time(t)
	if randi() % 2 == 0:
		enemy = ENEMY_SCENES.HalfCat.instance()
	else:
		enemy = ENEMY_SCENES.CursedCat.instance()

#	enemy = ENEMY_SCENES.CURSED_CAT.instance()
	enemy.position = player_in_map.position + Vector2(300,0).rotated(rand_range(0,2*PI))
	nav.call_deferred("add_child", enemy)
	
	
