extends "res://Weapons/Weapon.gd"

class_name BonkMissile, "res://Assets/Weapons/bonk-missile/bonk_missile-2.png"


### Automatic References Start ###
onready var _attack_timer: Timer = $AttackTimer
onready var _cool_down_timer: Timer = $CoolDownTimer

### Automatic References Stop ###

var mov_direction: Vector2 = Vector2.ZERO

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
#	set_as_toplevel(true)
	_attack_timer.start()
	
	
func _process(delta):
	pass
#	position = player.get_global_position()


func _on_AttackTimer_timeout():
	_cool_down_timer.start()

	
func _on_CooldownTimer_timeout():
	self.position = position
	self.target = get_random_target()
	print(Missile_ammo)
	if Missile_ammo > 0:
		Missile_ammo -= 1
		_cool_down_timer.start()
	else:
		Missile_ammo += 1
		_cool_down_timer.stop()	
	

			
func get_random_target():
	if enemy_close.size() > 0:
		var ran = enemy_close[randi() % enemy_close.size()].get_global_position()
		return ran
	else:
		return Vector2.UP
	


func _on_DetectEnemy_area_entered(area):
	if not enemy_close.has(area):
		if eneNum <=0:
			enemy_close.append(area)
		else:
			eneNum-=1


func _on_DetectEnemy_area_exited(area):
	if enemy_close.has(area):
		enemy_close.erase(area)


