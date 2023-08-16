extends "res://Characters/Enemies/Enemy.gd"


class_name UnfinishedHorse,"res://Assets/Characters/Enemies/Unfinished_horse/unfinished_horse-1.png"

var fires = preload("res://Characters/Enemies/UnfinishedHorse/Fires.tscn")
onready var posi = $spawn_Fires
onready var event = get_node("../../Enemy_Event") 

var move_to_event
var accel_old 
var spd_old
var check_up_spd = 0
func _ready():
	$Start_Event_Attack.start()
	

func _physics_process(delta):
	if check_up_spd == 0:
		accel_old = self.acceleration
		spd_old = self.spd
	if self.hp<=0 and Global.selectMod != 1:
		Global.victory = 1
		Global.game_Victory()
	if $AnimatedSprite.flip_h:
		posi.position.x = -97
	else:
		posi.position.x = 97
	move_to_event = mov_direction

func _on_Cooldawn_SpF_timeout():
	$SpF.start()
	check_up_spd=1
	self.acceleration = 300
	self.spd = 300
	nummm = 1
	$Stop_Event_Attack.start()

func _on_SpF_timeout():
	var spawnf = fires.instance()
	if $AnimatedSprite.flip_h:
		spawnf.position = position+Vector2(-100,100)
		posi.position.x = -97
	else:
		posi.position.x = 97
		spawnf.position = position+Vector2(100,100)
	event.call_deferred("add_child", spawnf)

func _on_Start_Event_Attack_timeout():
	check_up_spd=1
	self.spd = 0
	$Cooldawn_SpF.start()
	
func _on_Stop_Event_Attack_timeout():
	check_up_spd=0
	$SpF.stop()
	self.acceleration = accel_old
	self.spd = spd_old
	nummm = 0
	$Start_Event_Attack.start()
