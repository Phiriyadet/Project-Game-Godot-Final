extends Character
class_name Enemy


var path: = []
#onready var player := get_tree().current_scene.get_node("Player").get_child(0)
onready var navigation: Navigation2D = get_tree().current_scene.get_node("Areas")
onready var hitbox := get_node("Hitbox")
#onready var hitbox_coll := get_node("Hitbox/CollisionShape2D")
#onready var colli := get_node("CollisionShape2D")
#onready var path_timer: Timer = get_node("PathTimer")
onready var player := get_tree().current_scene.get_node("Player").get_child(0)


func chase():
	
	if player:
		generate_path()
		navigate()
	

#	if path:
#		var vector_to_next_point: Vector2 = path[0] - global_position
#		var distance_to_next_point: float = vector_to_next_point.length()
#		if distance_to_next_point < 1:
#			path.remove(0)
#			if not path:
#				return
#		mov_direction = vector_to_next_point
#
#		if vector_to_next_point.x > 0 and animated_sprite.flip_h:
#			animated_sprite.flip_h = false
#		elif vector_to_next_point.x < 0 and not animated_sprite.flip_h:
#			animated_sprite.flip_h = true
#	if path.size() > 0:
#		mov_direction = global_position.direction_to(path[1]) 
#
#		# If reached the destination, remove this point from path array
#		if global_position == path[0]:
#			path.pop_front()


#func _on_PathTimer_timeout():
#	if is_instance_valid(player):
#		los.look_at(player.global_position)
#		_get_path_to_player()
##		print_debug("path", path)
#	else:
#		path_timer.stop()
#		path = []
#		mov_direction = Vector2.ZERO
		
		
#func _get_path_to_player():
#
#	path = navigation.get_simple_path(global_position, player.position,false)
#	line2d.points = path




func navigate():	# Define the next position to go to
	if path.size() > 0:
		mov_direction = global_position.direction_to(path[1]) 
		# If reached the destination, remove this point from path array
		if global_position == path[0]:
			path.pop_front()

func generate_path():	# It's obvious
	if navigation != null and player != null:
		path = navigation.get_simple_path(global_position, player.global_position, false)
		
