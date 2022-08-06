extends Area2D
class_name Hitbox

export(int) var damage 
var knockback_direction: Vector2 = Vector2.ZERO
export(int) var knockback_force: int = 100

var body_inside: bool = false

onready var collision_shape: CollisionShape2D = get_child(0)
onready var timer: Timer = Timer.new()


func _init():
	var __ = connect("body_entered", self, "_on_body_entered")
	__ = connect("body_exited", self, "_on_body_exited")
	
	
func _ready():
	assert(collision_shape != null)
	timer.wait_time = 1
	add_child(timer)
	
	
func _on_body_entered(body):
	body_inside = true
	timer.start()
	while body_inside:
		_collide(body)
		yield(timer, "timeout")
	
	
func _on_body_exited(_body):
	body_inside = false
	timer.stop()
	
	
func _collide(body):
	if body == null or not body.has_method("take_damage"):
		queue_free()
	else:
		body.take_damage(damage, knockback_direction, knockback_force)

