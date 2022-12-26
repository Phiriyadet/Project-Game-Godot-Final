extends Character

class_name Player


export(float) var pickup_radius  setget set_pickup, get_pickup

onready var weapons: Node2D = get_node("Weapons")
onready var skills: Node2D = get_node("Skills")
onready var items: Node2D = get_node("Weapons")
onready var picradius:CollisionShape2D = get_node("PickupRadius/CollisionShape2D")


func _ready():
	pass

func _process(delta):
	
#	picradius.shape.radius = self.pickup_radius 
#	print(picradius.shape.radius)
	for skill in skills.get_children():
		match  skill.name:
			"Ameno":
				skill.level_skill
#				print_debug(skill.picup_radius)
	

func get_input():
	
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
		
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
#		animated_sprite.flip_h  = true

	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
#		animated_sprite.flip_h  = false

	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
	
			
	
func set_pickup(new_pick):
	pickup_radius = new_pick

func get_pickup():
	return pickup_radius
