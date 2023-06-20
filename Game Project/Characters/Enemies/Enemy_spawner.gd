tool
extends Node2D


const ENEMY_SCENES: Dictionary = { 
	"CursedCat":preload("res://Characters/Enemies/CursedCat/CursedCat.tscn"),
	"HalfCat":preload("res://Characters/Enemies/HalfCat/HalfCat.tscn")
}
#
const ENEMY_SPAWNS: Dictionary={
	0:{"time_start":0,"time_end":5,"enemy":ENEMY_SCENES.CursedCat,
	"enemy_number":5,"enemy_spawn_delay":0},
	1:{"time_start":5,"time_end":10,"enemy":ENEMY_SCENES.HalfCat,
	"enemy_number":5,"enemy_spawn_delay":0},
}
#

var time = 0	
#export(Spawn_info) var spawns 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	time += 1
	
	for i in ENEMY_SPAWNS:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = load(str(i.enemy.resource_path))
				var counter = 0
				while counter < i.enemy_number:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = player_in_map.position + Vector2(300,0).rotated(rand_range(0,2*PI))
					add_child(enemy_spawn)
					counter += 1
					
