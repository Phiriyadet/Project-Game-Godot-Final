extends "res://Characters/Enemies/Enemy.gd"


class_name UnfinishedHorse,"res://Assets/Characters/Enemies/Unfinished_horse/unfinished_horse-1.png"

onready var this_fire := get_node("this is fires")

var fires = preload("res://Characters/Enemies/UnfinishedHorse/Fires.tscn")
onready var posi = $spawn_Fires
onready var event = get_node("../../Enemy_Event") 

var move_to_event

func _ready():
	$Start_Event_Attack.start()
	

func _physics_process(delta):
	if self.hp<=0 and Global.selectMod != 1:
		Global.victory = 1
	if $AnimatedSprite.flip_h:
		posi.position.x = -97
	else:
		posi.position.x = 97
	move_to_event = mov_direction

func _on_Cooldawn_SpF_timeout():
	$SpF.start()
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
	self.spd = 0
	$Cooldawn_SpF.start()
	
func _on_Stop_Event_Attack_timeout():
	$SpF.stop()
	self.acceleration = 20
	self.spd = 50
	nummm = 0
	$Start_Event_Attack.start()
