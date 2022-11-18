extends Node2D

const ENEMY_SCENES: Dictionary = { 
	"CursedCat":preload("res://Characters/Enemies/CursedCat/CursedCat.tscn"),
	"HalfCat":preload("res://Characters/Enemies/HalfCat/HalfCat.tscn")
}

onready var player := $"%TheDog" as KinematicBody2D
onready var HUD := $"%HUD" as CanvasLayer
onready var count_time := $"%CountTime" as Timer
onready var nav := $Areas/Area

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
		enemy = ENEMY_SCENES.HalfCat.instance()
	else:
		enemy = ENEMY_SCENES.CursedCat.instance()

#	enemy = ENEMY_SCENES.CURSED_CAT.instance()
	enemy.position = player.position + Vector2(300,0).rotated(rand_range(0,2*PI))
	nav.call_deferred("add_child", enemy)
	
	
