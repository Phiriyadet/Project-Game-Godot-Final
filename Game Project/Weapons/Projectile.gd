extends "res://Weapons/WeaponHitbox.gd"

class_name Bullet,"res://Assets/Weapons/gunhand/gunhand-2.png"

# variable to check if bullet hit an enemy or not
var enemy_exited: bool = false

# variable to store the direction and speed of the bullet
var direction: Vector2 = Vector2.ZERO
var speed: int = 0

# function to launch the bullet
func launch(initial_position: Vector2, dir: Vector2, spd: int, attack:int):
	position = initial_position
	direction = dir
	knockback_direction = dir
	speed = spd
	# set the rotation of the bullet according to the direction
	rotation += dir.angle() 
  
	# set the damage of the bullet
	self.damage = attack
	# start the timer
	$Timer.start()

# function to update the position of the bullet in each physics frame
func _physics_process(delta: float):
	position += direction * speed * delta / 2

# function to be called when the timer expires
func _on_Timer_timeout():
	# remove the bullet from the scene
	queue_free()
