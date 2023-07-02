tool
extends Node2D


const ENEMY_SCENES: Dictionary = {
	"Cockroach": preload("res://Characters/Enemies/Cockroach/Cockroach.tscn"),
	"CoffinDance": preload("res://Characters/Enemies/CoffinDance/CoffinDance.tscn"),
	"CursedCat": preload("res://Characters/Enemies/CursedCat/CursedCat.tscn"),
	"EggDog": preload("res://Characters/Enemies/EggDog/EggDog.tscn"),
	"HalfCat": preload("res://Characters/Enemies/HalfCat/HalfCat.tscn"),
	"LaughingWolvesBanner": preload("res://Characters/Enemies/LaughingWolvesBanner/LaughingWolvesBanner.tscn"),
	"OofStones": preload("res://Characters/Enemies/OofStones/OofStones.tscn"),
	"PopCat": preload("res://Characters/Enemies/PopCat/PopCat.tscn"),
	"ShrekTPost": preload("res://Characters/Enemies/ShrekTPost/ShrekTPost.tscn"),
	"TRexCostume": preload("res://Characters/Enemies/TRexCostume/TRexCostume.tscn"),
	"UgandaKnuckles": preload("res://Characters/Enemies/UgandaKnuckles/UgandaKnuckles.tscn"),
	"UnfinishedHorse": preload("res://Characters/Enemies/UnfinishedHorse/UnfinishedHorse.tscn"),
}


const ENEMY_SPAWNS: Dictionary={
	0: {
		"time_start": 0,
		"time_end": 5,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 2,
		"enemy_spawn_delay": 0,
		
	},
	1: {
		"time_start": 10,
		"time_end": 15,
		"enemy": ENEMY_SCENES.HalfCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	2: {
		"time_start": 15,
		"time_end": 30,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	3: {
		"time_start": 15,
		"time_end": 30,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	4: {
		"time_start": 30,
		"time_end": 50,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	5: {
		"time_start": 50,
		"time_end": 70,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	6: {
		"time_start": 70,
		"time_end": 100,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	
}

onready var HUD := get_node("../HUD")
onready var enemies := get_node("../Enemies")
onready var count_time = $Timer
# Declare member variables here. Examples:
var time = 0
var enemy_spawn :KinematicBody2D
var player_in_map : KinematicBody2D
var plus_status = 0
var enemy_number = 0

func _ready():
	match Global.difficulty_level:
		1:
			Global.coin_bonus = 0
			plus_status = 0
		2:
			Global.coin_bonus = 0
			plus_status = 0.5
		3:
			Global.coin_bonus = 0
			plus_status = 1
			
	

func player_start(player):
	player_in_map = player
	count_time.start()


func _on_Timer_timeout():
	time += 1
	HUD.update_time(time)
	for i in ENEMY_SPAWNS:
		var spawn_delay_counter = 0  # เพิ่มบรรทัดนี้

		if time >= ENEMY_SPAWNS[i]["time_start"] and time <= ENEMY_SPAWNS[i]["time_end"]:
			var enemy_spawn_delay = ENEMY_SPAWNS[i]["enemy_spawn_delay"]

			if spawn_delay_counter < enemy_spawn_delay:
				spawn_delay_counter += 1
			else:
				spawn_delay_counter = 0

				var counter = 0
				while counter < ENEMY_SPAWNS[i]["enemy_number"]:
					enemy_spawn = ENEMY_SPAWNS[i]["enemy"].instance()
					enemy_spawn.position = player_in_map.position + Vector2(500, 100).rotated(rand_range(0, 2 * PI))
					enemy_spawn.set_maxhp(enemy_spawn.get_maxhp()+(enemy_spawn.get_maxhp()*plus_status))
					enemy_spawn.set_hp(enemy_spawn.get_hp()+(enemy_spawn.get_hp()*plus_status))
					enemy_spawn.set_atk(enemy_spawn.get_atk()+(enemy_spawn.get_atk()*plus_status))
					enemy_spawn.set_spd(enemy_spawn.get_spd()+(enemy_spawn.get_spd()*plus_status))
					
					enemies.call_deferred("add_child", enemy_spawn)
					counter += 1
					enemy_number+=1

