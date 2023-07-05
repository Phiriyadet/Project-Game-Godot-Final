extends Character
class_name Enemy


var path: = []
onready var player := get_tree().current_scene.get_node("Player").get_child(0)

onready var loot := get_tree().current_scene.get_node("Loot")
onready var hitbox := get_node("Hitbox")
onready var exp_gem = preload("res://Exp/Exp_gem.tscn")

export(int) var  exp_enemy = 1 setget set_expmon, get_expmon

var posi_enemy = Vector2.ZERO
var posi_player

#onready var enemy_spawn = preload("res://Characters/Enemies/Enemy_spawner.gd")
func _physics_process(delta):
	posi_player = player.global_position
	if (position.x-posi_player.x) > 800 or (position.x-posi_player.x) < -800:
			print(position - posi_player)
			queue_free()
			Global.num0-=1
	elif (position.y-posi_player.y) > 800 or (position.y-posi_player.y) < -800:
			print(position - posi_player)
			queue_free()
			Global.num0-=1
			

#ฟังก์ชัน ค้นหาเส้นทางเพื่อไล่ตามตัวละครผู้เล่น
func chase():
	hitbox.damage = self.atk
	if player:
		mov_direction = global_position.direction_to(player.global_position)

func dropgem():
	var new_gem = exp_gem.instance()
	new_gem.global_position = global_position
	new_gem.experience = exp_enemy
	loot.call_deferred("add_child", new_gem)	
		
func set_expmon(new_exp):
	exp_enemy = new_exp
	
func get_expmon():
	return exp_enemy

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




#func navigate():	# Define the next position to go to
#	if path.size() > 0:
#		mov_direction = global_position.direction_to(path[1]) 
#		# If reached the destination, remove this point from path array
#		if global_position == path[0]:
#			path.pop_front()
#
#func generate_path():	# It's obvious
#	if navigation != null and player != null:
#		path = navigation.get_simple_path(global_position, player.global_position, false)
		

