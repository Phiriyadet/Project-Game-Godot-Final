extends Node2D

var minX = 202  # Minimum X coordinate
var maxX = 400  # Maximum X coordinate
var minY = 202  # Minimum Y coordinate
var maxY = 400   # Maximum Y coordinate

var moveSpeed = 100  # Speed at which the object moves

var targetPosition = Vector2.ZERO

func _ready():
	# Call move_to() when the scene starts
	move_to(get_random_position())

func _fixed_process(delta):
	# In the _fixed_process(delta) function, delta is provided automatically
	move_to(targetPosition)

func get_random_position():
	# Generate random coordinates within the specified range
	var randomX = rand_range(minX, maxX)
	var randomY = rand_range(minY, maxY)
	
	# Calculate and return the random position
	return Vector2(randomX, randomY)

func move_to(target):
	targetPosition = target  # Store the target position
	var direction = targetPosition - position
	direction = direction.normalized()
	
	# Move the object towards the target
	if position.distance_to(targetPosition) > 1.0:
		position += direction * moveSpeed * 5
