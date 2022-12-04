extends Hitbox

class_name Bullet,"res://Assets/Weapons/gunhand/gunhand-2.png"
var enemy_exited: bool = false

var direction: Vector2 = Vector2.ZERO
var speed: int = 0


func launch(initial_position: Vector2, dir: Vector2, speed: int):
	position = initial_position
	direction = dir
	knockback_direction = dir
	speed = speed

func _physics_process(delta: float):
	
	position += direction * speed * delta
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
