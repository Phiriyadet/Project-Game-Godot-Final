extends Area2D

var Missile = preload("res://Weapons/BonkMissile/BonkMissile.tscn")


var mov_direction: Vector2 = Vector2.ZERO

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)

var speed = 200
var target = Vector2.ZERO
var angle = Vector2.ZERO

var Missile_ammo = 0
var Missile_ammo_2 = Missile_ammo

var enemy_close = []
var eneNum = 3

var check = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	$Timer_Attak.start()
	
	
func _process(delta):
	position = player.get_global_position()

func _on_Timer_Attak_timeout():
	$Timer_Cooldown.start()

func _on_Timer_Cooldown_timeout():
	var Missile_attack = Missile.instance()
	Missile_attack.position = position
	Missile_attack.target = get_random_target()
	print(Missile_ammo)
	if Missile_ammo > 0:
		Missile_ammo -= 1
		add_child(Missile_attack)
		$Timer_Cooldown.start()
	else:
		Missile_ammo += 1
		$Timer_Cooldown.stop()	
	

			
func get_random_target():
	if enemy_close.size() > 0:
		var ran = enemy_close[randi() % enemy_close.size()].get_global_position()
		return ran
	else:
		return Vector2.UP

func _on_SpawMissile_area_entered(area):
	if not enemy_close.has(area):
		if eneNum <=0:
			enemy_close.append(area)
		else:
			eneNum-=1

func _on_SpawMissile_area_exited(area):
	if enemy_close.has(area):
		enemy_close.erase(area)
