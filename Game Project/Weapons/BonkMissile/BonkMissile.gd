extends "res://Weapons/Weapon.gd"

class_name BonkMissile, "res://Assets/Weapons/bonk-missile/bonk_missile-1.png"

var speed = 200

var target = Vector2.ZERO
var angle = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	angle = global_position.direction_to(target)
	rotation = angle.angle()
	$Timer_QF.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += angle * speed * delta
	
func _on_Timer_QF_timeout():
	queue_free()
	
