extends Character
class_name Enemy



onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)



func _ready() -> void:
	pass


func chase() -> void:

	if player:
		mov_direction = (player.position - position).normalized()
		if mov_direction.x > 0 and animated_sprite.flip_h:
			animated_sprite.flip_h = false
		elif mov_direction.x < 0 and not animated_sprite.flip_h:
			animated_sprite.flip_h = true


		
		

