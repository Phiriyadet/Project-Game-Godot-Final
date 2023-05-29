extends "res://Weapons/Weapon.gd"

class_name BonkMissile, "res://Assets/Weapons/bonk-missile/bonk_missile-1.png"

var speed = 200

onready var Missile_Timer = $CoolDownTimer

var target = Vector2.ZERO
var angle = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	angle = global_position.direction_to(target)
	rotation = angle.angle()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += angle * speed * delta

func _on_Timer_Attack_timeout():
	pass
	
