extends Character


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_input() -> void:
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
		animated_sprite.flip_h  = false
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
		animated_sprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
		

	
