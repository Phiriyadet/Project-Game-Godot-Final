extends "res://Weapons/Weapon.gd"

class_name BonkMissile, "res://Assets/Weapons/bonk-missile/bonk_missile-1.png"

### Automatic References Start ###
onready var _attack_timer: Timer = $AttackTimer
onready var _node2d: Node2D = $Node2D
onready var detect_enemy_area: CollisionShape2D = $DetectEnemy/CollisionShape2D

### Automatic References Stop ###

var speed = 200

var target = Vector2.ZERO
var angle = Vector2.ZERO

var enemy_close = []
var eneNum = 3

var check = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_node2d.rotation = angle.angle()
	position += angle.normalized() * speed * delta
	
#เรียกใช้ใน AnimationPlayer
func AttackTimer_timeout():
	set_process(false)
	detect_enemy_area.disabled = true
	print_debug("AttackTimer_timeout")
#	cool_down_timer.start() #ติดปัญหาเรียกแล้วไม่ทำงาน

#func _on_CoolDownTimer_timeout():
#
#	print_debug("CoolDownTimer_timeout")
	
#เรียกใช้ใน AnimationPlayer
func launch():
	set_process(true)
	position = Vector2.ZERO
	print_debug("position start:",position,"player po:",player.position)
	
	detect_enemy_area.disabled = false
	target = get_random_target()
	angle = position.direction_to(target)
#	_attack_timer.start()
	
func get_random_target():
#	if enemy_close.size() > 0:
#		var ran = enemy_close[randi() % enemy_close.size()].get_global_position()
#		return ran
#	else:
#		return Vector2.UP
	var range_x = rand_range(-500, 500)  # สุ่มตำแหน่ง X ในช่วง -500 ถึง 500
	var range_y = rand_range(-500, 500)  # สุ่มตำแหน่ง Y ในช่วง -500 ถึง 500
	return Vector2(range_x, range_y)

func check_level():
	match level:
		1, 2:
			self.atk_w += 40
			print_debug("BonkMissile : ", level)
		3, 4:
			self.atk_w += 60
			print_debug("BonkMissile : ", level)
		5, 6:
			self.atk_w += 80
			print_debug("BonkMissile : ", level)
		7:
			self.atk_w += 100
			print_debug("BonkMissile : ", level)

func _on_DetectEnemy_area_entered(area):
	if !enemy_close.has(area):
		if eneNum > 0:
			enemy_close.append(area)
			eneNum -= 1

func _on_DetectEnemy_area_exited(area):
	if enemy_close.has(area):
		enemy_close.erase(area)
		eneNum += 1
