extends KinematicBody2D


onready var pop_shot = $PopCat
onready var player := get_tree().current_scene.get_node("Player").get_child(0)
onready var spawn_fire = $Spawn_Fire

var mov_direction = Vector2.ZERO
var fire_ball = preload("res://Characters/Enemy_Event/Fireball.tscn")

func _ready():
	pop_shot.spd = 0

func _physics_process(delta):
	if is_instance_valid(pop_shot):
		pop_shot.animated_sprite.play("pop_shot")
		player = get_tree().current_scene.get_node("Player").get_child(0)
		mov_direction = global_position.direction_to(player.global_position)
		if mov_direction.x < 0:
			pop_shot.animated_sprite.flip_h  = true
			spawn_fire.position.x = -20
		if mov_direction.x > 0:
			pop_shot.animated_sprite.flip_h  = false
			spawn_fire.position.x = 13
	else:
		queue_free()

func _on_Attack_timeout():
	var fire_Attack = fire_ball.instance()
	fire_Attack.position = spawn_fire.position
	add_child(fire_Attack)


func _on_Queue_timeout():
	queue_free()
