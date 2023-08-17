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
		"time_start": 1,
		"time_end": 180,
		"enemy": ENEMY_SCENES.CursedCat,
		"enemy_number": 2,
		"enemy_spawn_delay": 0,
		
	},
	1: {
		"time_start": 120,
		"time_end": 320,
		"enemy": ENEMY_SCENES.HalfCat,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	2: {
		"time_start": 240,
		"time_end": 540,
		"enemy": ENEMY_SCENES.Cockroach,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	3: {
		"time_start": 360,
		"time_end": 620,
		"enemy": ENEMY_SCENES.EggDog,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	4: {
		"time_start": 520,
		"time_end": 840,
		"enemy": ENEMY_SCENES.OofStones,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	5: {
		"time_start": 720,
		"time_end": 900,
		"enemy": ENEMY_SCENES.UgandaKnuckles,
		"enemy_number": 3,
		"enemy_spawn_delay": 0,
		
	},
	
}

const BOSS_SPAWN:Dictionary = {
	0: {
		"time_start" : [20,120,240,360,540,720],
		"enemy": ENEMY_SCENES.CoffinDance,
		
	},
	1: {
		"time_start" : [300,420,540,840],
		"enemy": ENEMY_SCENES.LaughingWolvesBanner,
		
	},
	2: {
		"time_start" : [600,720,840],
		"enemy": ENEMY_SCENES.TRexCostume,
		
	},
	3: {
		"time_start" : [900,0],
		"enemy": ENEMY_SCENES.UnfinishedHorse,
		
	},
}

onready var HUD := get_node("../HUD")
onready var enemies := get_node("../Enemies")
onready var event:= get_node("../Enemy_Event")
onready var count_time = $Timer
# Declare member variables here. Examples:
var time = 0
var enemy_spawn :KinematicBody2D
var player_in_map : KinematicBody2D
var plus_status = 0
var enemy_number = 0

var enemy_Event_cycle = preload("res://Characters/Enemy_Event/Cycle2.tscn")
var enemy_Event_RunOn = preload("res://Characters/Enemy_Event/Enemy_run_to_player.tscn")
var enemy_Event_shot = preload("res://Characters/Enemy_Event/Pop_shot.tscn")

var fires = preload("res://Characters/Enemies/UnfinishedHorse/Fires.tscn")

func _ready():
	Global.victory = 0
	Global.gio_take_dm = 0
	match Global.difficulty_level:
		1:
			Global.coin_bonus_diffl = 0
			plus_status = 0
		2:
			Global.coin_bonus_diffl = 0.3
			plus_status = 0.5
		3:
			Global.coin_bonus_diffl = 0.5
			plus_status = 1
			
	

func player_start(player):
	player_in_map = player
	count_time.start()

var upspeed = 20
var timeupspeed = 0
func _on_Timer_timeout():
	if time > 1200 and Global.selectMod == 1:
		timeupspeed +=2
		for i in range(0,3):
			if Global.num0 < 100:
				var ran = int(randi()% 6)
				enemy_spawn = ENEMY_SPAWNS[ran]["enemy"].instance()
				enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
				enemy_spawn.set_maxhp(enemy_spawn.get_maxhp()+(enemy_spawn.get_maxhp()*plus_status))
				enemy_spawn.set_hp(enemy_spawn.get_hp()+(enemy_spawn.get_hp()*plus_status))
				enemy_spawn.set_atk(enemy_spawn.get_atk()+(enemy_spawn.get_atk()*plus_status))
				enemy_spawn.set_spd(enemy_spawn.get_spd()+(enemy_spawn.get_spd()*plus_status)+(upspeed))
				enemies.call_deferred("add_child", enemy_spawn)
				Global.num0 +=1
		if timeupspeed	>= 30 and timeupspeed%30 == 0:
			upspeed += 2	
			
		if timeupspeed >= 180 and timeupspeed%180 == 0:
			var random_boss = randi()% 3 + 1
			enemy_spawn = BOSS_SPAWN[int(random_boss)]["enemy"].instance()
			enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
			enemy_spawn.set_maxhp(enemy_spawn.get_maxhp()+(enemy_spawn.get_maxhp()*plus_status))
			enemy_spawn.set_hp(enemy_spawn.get_hp()+(enemy_spawn.get_hp()*plus_status))
			enemy_spawn.set_atk(enemy_spawn.get_atk()+(enemy_spawn.get_atk()*plus_status))
			enemy_spawn.set_spd(enemy_spawn.get_spd()+(enemy_spawn.get_spd()*plus_status)+upspeed)
			enemy_spawn.Type = "Boss"
			enemies.call_deferred("add_child", enemy_spawn)
			
		if timeupspeed >= 300 and timeupspeed%300 == 0:
			var random_Event = randi()% 3
			
			if random_Event == 0:
				enemy_spawn = enemy_Event_cycle.instance()
				enemy_spawn.position = player_in_map.position
				event.call_deferred("add_child", enemy_spawn)	
				
			if random_Event == 1:
				for i in range(0,10):
					enemy_spawn = enemy_Event_RunOn.instance()
					enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
					event.call_deferred("add_child", enemy_spawn)
				
			if random_Event == 2:
				for i in range(0,10):
					enemy_spawn = enemy_Event_shot.instance()
					enemy_spawn.position = player_in_map.position + Vector2(500, 100).rotated(rand_range(0, 2 * PI))
					event.call_deferred("add_child", enemy_spawn)
				
		if timeupspeed >= 600 and timeupspeed%600 == 0:
			enemy_spawn = BOSS_SPAWN[3]["enemy"].instance()
			enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
			enemy_spawn.set_maxhp(enemy_spawn.get_maxhp()+(enemy_spawn.get_maxhp()*plus_status))
			enemy_spawn.set_hp(enemy_spawn.get_hp()+(enemy_spawn.get_hp()*plus_status))
			enemy_spawn.set_atk(enemy_spawn.get_atk()+(enemy_spawn.get_atk()*plus_status))
			enemy_spawn.set_spd(enemy_spawn.get_spd()+(enemy_spawn.get_spd()*plus_status)+upspeed)
			enemy_spawn.Type = "Boss"
			enemies.call_deferred("add_child", enemy_spawn)
			
			
			
	time += 1
	if time >= 1200 and Global.selectMod == 0:
		Global.player_dead = true
	HUD.update_time(time)
	for i in ENEMY_SPAWNS:
		var spawn_delay_counter = 0  # เพิ่มบรรทัดนี้
		if time >= ENEMY_SPAWNS[i]["time_start"] and time <= ENEMY_SPAWNS[i]["time_end"]:
			var enemy_spawn_delay = ENEMY_SPAWNS[i]["enemy_spawn_delay"]

			if spawn_delay_counter < enemy_spawn_delay :
				spawn_delay_counter += 1
			else:
				spawn_delay_counter = 0

				var counter = 0
				while counter < ENEMY_SPAWNS[i]["enemy_number"] and Global.num0 < 100:
					enemy_spawn = ENEMY_SPAWNS[i]["enemy"].instance()
					enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
					enemy_spawn.set_maxhp(enemy_spawn.get_maxhp()+(enemy_spawn.get_maxhp()*plus_status))
					enemy_spawn.set_hp(enemy_spawn.get_hp()+(enemy_spawn.get_hp()*plus_status))
					enemy_spawn.set_atk(enemy_spawn.get_atk()+(enemy_spawn.get_atk()*plus_status))
					enemy_spawn.set_spd(enemy_spawn.get_spd()+(enemy_spawn.get_spd()*plus_status))

					enemies.call_deferred("add_child", enemy_spawn)
					counter += 1
					Global.num0 +=1
					
	for i in BOSS_SPAWN:
		if time in BOSS_SPAWN[i]["time_start"]:
			enemy_spawn = BOSS_SPAWN[i]["enemy"].instance()
			enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
			enemy_spawn.set_maxhp(enemy_spawn.get_maxhp()+(enemy_spawn.get_maxhp()*plus_status))
			enemy_spawn.set_hp(enemy_spawn.get_hp()+(enemy_spawn.get_hp()*plus_status))
			enemy_spawn.set_atk(enemy_spawn.get_atk()+(enemy_spawn.get_atk()*plus_status))
			enemy_spawn.set_spd(enemy_spawn.get_spd()+(enemy_spawn.get_spd()*plus_status))
			enemy_spawn.Type = "Boss"
			enemies.call_deferred("add_child", enemy_spawn)
			
	# Max 900
	if time == 180 or time == 420 or time == 720:
		enemy_spawn = enemy_Event_cycle.instance()
		enemy_spawn.position = player_in_map.position
		event.call_deferred("add_child", enemy_spawn)
		
	if (time>=120 and time<=140) or (time>=240 and time<=280) and time%2==0:
		enemy_spawn = enemy_Event_RunOn.instance()
		enemy_spawn.position = player_in_map.position + Vector2(700, 100).rotated(rand_range(0, 2 * PI))
		event.call_deferred("add_child", enemy_spawn)

	if (time>=140 and time<=180) or (time>=300 and time<=340) and time%2==0:
		enemy_spawn = enemy_Event_shot.instance()
		enemy_spawn.position = player_in_map.position + Vector2(500, 100).rotated(rand_range(0, 2 * PI))
		event.call_deferred("add_child", enemy_spawn)
