extends Character

onready var bonkbat:Node2D = get_node("Weapons/BonkBat")
onready var pickup_radius = get_node("PickupRadius/CollisionShape2D").shape.radius


func _ready():
#	while true:
#		weapon.get_node("AnimationPlayer").play("attack")
	pass
	



func get_input() -> void:
	
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
		
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
		animated_sprite.flip_h  = true
#		weapon.get_node("Node2D/Sprite").flip_h = true
#		bonkbat.set_flip(true)
		
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
		animated_sprite.flip_h  = false
#		weapon.get_node("Node2D/Sprite").flip_h = false
#		bonkbat.set_flip(false)
		
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
		
		
	
		

	





