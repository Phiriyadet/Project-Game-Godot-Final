extends Hitbox

class_name Bullet,"res://Assets/Weapons/gunhand/gunhand-2.png"
var enemy_exited: bool = false

var direction: Vector2 = Vector2.ZERO
var speed: int = 0


func launch(initial_position: Vector2, dir: Vector2, spd: int, attack:int):
	position = initial_position
	direction = dir
	knockback_direction = dir
	speed = spd
	rotation += dir.angle() 
	$Timer.start()
	self.damage = attack

func _physics_process(delta: float):
	position += direction * speed * delta / 2
	
func _on_Timer_timeout():
	queue_free() # Replace with function body.
