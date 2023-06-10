extends "res://Weapons/Weapon.gd"

class_name BonkMissile, "res://Assets/Weapons/bonk-missile/bonk_missile-1.png"


### Automatic References Start ###
onready var _attack_timer: Timer = $AttackTimer
onready var _node2d: Node2D = $Node2D
### Automatic References Stop ###

var speed = 200

var target = Vector2.ZERO
var angle = Vector2.ZERO

var enemy_close = []
var eneNum = 3

var check = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	cool_down_timer.connect("timeout", self, "_on_Timer_Cooldown_timeout")
#	angle = global_position.direction_to(target)
#	_node2d.rotation = angle.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	angle = global_position.direction_to(target)
#	angle = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	_node2d.rotation = angle.angle()
	_node2d.position += angle * speed * delta


func _on_AttackTimer_timeout():
	print_debug("Missile attack timeout")
	_node2d.visible = false
	set_process(false)
#	animation_player.stop()
	cool_down_timer.start()
	
func _on_Timer_Cooldown_timeout():
	#animation_player.play("attack")
	print_debug("Missile cooldawn timeout")
	_node2d.visible = true
	_node2d.position = Vector2.ZERO
	target = get_random_target()
	angle = global_position.direction_to(target)
	
	set_process(true)
	var random_angle = rand_range(0, 360)
	var direction = Vector2(cos(deg2rad(random_angle)), sin(deg2rad(random_angle)))
	angle = direction.normalized()
	_attack_timer.start()
	
	

func get_random_target():
	if enemy_close.size() > 0:
		var ran = enemy_close[randi() % enemy_close.size()].get_global_position()
		return ran
	else:
		return Vector2.UP

				
func check_level_weapon():
	match level_weapon:
		1,2:
			self.atk_w += 40
		3,4:
			self.atk_w += 60
		5,6:
			self.atk_w += 80
		7:
			self.atk_w += 100


func _on_DetectEneny_area_entered(area):
	if not enemy_close.has(area):
		if eneNum <=0:
			enemy_close.append(area)
		else:
			eneNum-=1

func _on_DetectEneny_area_exited(area):
	if enemy_close.has(area):
		enemy_close.erase(area)



