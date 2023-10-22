extends Node2D

var Explosion = preload("res://Weapons/weapon_new/Explosion!!!.tscn")

var enemy_list = []
var enemy_count = 0
var move_to = Vector2.ZERO
var target = Vector2.ZERO
var angle = Vector2.ZERO

export(int) var atk_w 
export(int) var explosion_size = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.hide()
	Global.sound_Explosion = 0

func _physics_process(delta):
	position += move_to*3
	rotation = angle.angle()
#	print(enemy_list.size())

func get_random_enemy():
	if enemy_list.size() > 0:
		var ran = enemy_list[randi() % enemy_list.size()].get_global_position()
		return ran
	else:
		return Vector2.UP	

func _on_Detect_Enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Dis_collision.start()
	if !enemy_list.has(body):
		enemy_list.append(body)

func _on_Detect_Enemy_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if enemy_list.has(body):
		enemy_list.erase(body)


func _on_Colision_missile_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	var spw_Explosion = Explosion.instance()
	spw_Explosion.position = position
	spw_Explosion.atk_w = self.atk_w
	spw_Explosion.explosion_size = explosion_size
	get_parent().call_deferred("add_child",spw_Explosion)
	queue_free()


func _on_queue_timeout():
	queue_free()


func _on_Dis_collision_timeout():
	enemy_count+=1
	if enemy_count == 1:
		target = get_random_enemy()
		angle = position.direction_to(target)
		move_to = global_position.direction_to(target)
	$Sprite.show()
