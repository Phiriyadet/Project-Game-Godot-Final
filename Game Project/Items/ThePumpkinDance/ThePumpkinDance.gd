extends "res://Items/Item.gd"

class_name ThePumpkinDance, "res://Assets/Items/pumpkin_dance-5.png"


### Automatic References Start ###
onready var _collision2d: CollisionShape2D = $Area2D/CollisionShape2D
### Automatic References Stop ###

onready var cooldown_timer = $CoolDownTimer
onready var appearance_timer = $AppearanceTimer

var wait_time = 0.0

var center: Vector2 = Vector2.ZERO
var radius: float = 0.0
var speed: float = 1.0
var angle: float = 0.0

var eXp = []
var eXpnum = 1
var onec = 0
var move_to = Vector2.ZERO
var posi_exp = true
var pumpkin_num = 0
var pumdance = preload("res://Items/new_Item/Pumpkin_spw.tscn")

var old_Lv = 1
var now_Lv = self.level
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.speed_pumpkin = 3
#	self.visible = false
#	start_cooldown() # Start the cooldown timer initially
#	eXp = []
#	$move_to_exp.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
##	if eXp != null:
##		position
##	angle += speed * delta
#
#	# คำนวณระยะทางใหม่ของลูกบอลที่ควรอยู่
#	var new_x = center.x + radius * cos(angle)
#	var new_y = center.y + radius * sin(angle)
#
#	# ตั้งค่าตำแหน่งใหม่ให้กับลูกบอล
#	position = Vector2(new_x, new_y)
##	position.x += 1
#	# หากกลับมาอยู่ที่จุดศูนย์กลางให้กลับความเร็วให้เป็นบวกเพื่อให้ลูกบอลหมุนไปทางซ้ายอีกครั้ง
#	if radius >= 100:
#		speed *= -1
#
#	# หากกลับมาอยู่ที่จุดศูนย์กลางให้นับเวลารอคูลดาวน์
#	if radius <= 0:
#		start_cooldown()
	
func _physics_process(delta):
	now_Lv = self.level
	if old_Lv < now_Lv:
		Global.speed_pumpkin+=1
		pumpkin_num-=1
		old_Lv+=1
		
#	if posi_exp == true:
#		position += move_to*5
#	if eXp.size() == 1:
#
#		var expp = get_random_exp()
#		move_to = global_position.direction_to(expp)
#		onec+=1
#
##
##
#func get_random_exp():
#	if eXp.size() > 0:
#		var ran = eXp[randi() % eXp.size()].get_global_position()
#		return ran
#	else:
#		return Vector2.UP

func check_level():
	match level:
		1,2:
			wait_time += 5.0
		3,4:
			wait_time += 8.0
		5,6:
			wait_time += 11.0
		7:
			wait_time += 14.0

#func start_cooldown():
#	appearance_timer.wait_time = wait_time
#	cooldown_timer.start()
#	print_debug("Appearance. Wait time:", wait_time)

#func _on_CoolDownTimer_timeout():
#	appearance_timer.start()
#	self.visible = true
#	_collision2d.disabled = false
#
#
#func _on_AppearanceTimer_timeout():
#	cooldown_timer.start()
#	self.visible = false
#	_collision2d.disabled = true
#
#
#func _on_Area2D_area_entered(area):
#	if area.is_in_group("loot"):
#		area.target = self
#
#
#func _on_Area2D2_area_entered(area):
#	if !eXp.has(area):
#		if eXpnum > 0:
#			eXp.append(area)
#			eXpnum-=1
#
#func _on_Area2D2_area_exited(area):
#	if eXp.has(area):
#		eXp.erase(area)
#		eXpnum += 1
#
#
#func _on_move_to_exp_timeout():
##	$Area2D2/CollisionShape2D.disabled = true
##	$Timer.start()
##	if self.level < 7:
##		self.level+=0.5
##		Global.speed_pumpkin+=1
##		pumpkin_num-=1
#	pass
#
#
#func _on_Area2D3_area_entered(area):
#	area.position = get_parent().get_parent().get_global_position()
#	posi_exp = false
#

func _on_Timer_timeout():
#	$Area2D2/CollisionShape2D.disabled = false
#	posi_exp = true
#	$move_to_exp.start()
	if pumpkin_num <=0:
		var spw_pum = pumdance.instance()
		spw_pum.position = get_parent().get_parent().get_global_position()
		get_parent().get_parent().get_parent().get_node("../Loot").call_deferred("add_child",spw_pum)
		pumpkin_num+=1
#
