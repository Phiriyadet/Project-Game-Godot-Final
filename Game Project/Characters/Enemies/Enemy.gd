extends Character
class_name Enemy



onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)
onready var hitbox := get_node("Hitbox")
onready var hitbox_coll := get_node("Hitbox/CollisionShape2D")
onready var colli := get_node("CollisionShape2D")



func _ready():
	pass


func chase():

	if player:
		mov_direction = (player.position - position).normalized() 
		if mov_direction.x > 0 and animated_sprite.flip_h:
			animated_sprite.flip_h = false
		elif mov_direction.x < 0 and not animated_sprite.flip_h:
			animated_sprite.flip_h = true


		
		

