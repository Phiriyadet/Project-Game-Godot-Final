extends Node2D

const ENEMY_SCENES: Dictionary = { 
	'SHREK_TPOST': preload ("res://Characters/Enemies/Shrek-t-post/Shrek-t-post.tscn"),
	'CURSED_CAT':preload("res://Characters/Enemies/Cursed_cat/CursedCat.tscn")

}

onready var player := $"%Dog" as KinematicBody2D

onready var HUD := $"%HUD" as CanvasLayer
onready var count_time := $"%CountTime" as Timer


# Declare member variables here. Examples:
var t = 0
var enemy :KinematicBody2D


func _init():
	randomize()
	
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	count_time.start()

func _on_CountTime_timeout():
	t += 1
	HUD.update_time(t)
	if randi() % 2 == 0:
		enemy = ENEMY_SCENES.SHREK_TPOST.instance()
	else:
		enemy = ENEMY_SCENES.CURSED_CAT.instance()
	
	enemy.position = player.position + Vector2(1000,0).rotated(rand_range(0,2*PI))
	add_child(enemy)
	
	
