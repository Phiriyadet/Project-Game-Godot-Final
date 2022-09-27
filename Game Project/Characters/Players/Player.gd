extends Character

class_name Player

export(float) var crt = 5 setget set_crt, get_crt
export(float) var pickup_radius = 20 setget set_pickup, get_pickup

onready var weapons: Node2D = get_node("Weapons")
onready var radius = get_node("PickupRadius/CollisionShape2D").shape.radius


func _ready():
	radius = pickup_radius


func get_input():
	
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
		
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
		animated_sprite.flip_h  = true

	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
		animated_sprite.flip_h  = false

	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
	
			
func set_crt(new_crt):
	crt += new_crt
	
func get_crt():
	return crt
	
func set_pickup(new_pick):
	pickup_radius += new_pick

func get_pickup():
	return pickup_radius
