extends Area2D
class_name Hitbox


export(int) var damage = 1 setget set_damage, get_damage
var knockback_direction: Vector2 = Vector2.ZERO
export(int) var knockback_force: int = 100

var body_inside: bool = false

onready var collision_shape: CollisionShape2D = $CollisionShape2D
onready var timer: Timer = Timer.new()


func _init():
	var __ = connect("body_entered", self, "_on_body_entered")
	__ = connect("body_exited", self, "_on_body_exited")
	
	
func _ready():

#	self.set_damage(1)
	assert(collision_shape != null)
	timer.wait_time = 1
	add_child(timer)
	
	
func _on_body_entered(body):# body ของตัวที่โดน
	if body == null or not body.has_method("take_damage"):#มี error
		queue_free()
		print_debug(body)
	else:
		body.take_damage(damage, knockback_direction, knockback_force)
#	body_inside = true
#	timer.start()
#	while body_inside:
#		_collide(body)
#		yield(timer, "timeout")
	
	
func _on_body_exited(_body):
	body_inside = false
	timer.stop()
	
	
func _collide(body): #ส่ง damage ไปยัง body
	if body == null or not body.has_method("take_damage"):#มี error
		queue_free()
	else:
		body.take_damage(damage, knockback_direction, knockback_force)

func set_damage(new_damage):
	damage = new_damage
#	print_debug(damage)
	
func get_damage():
	return damage
