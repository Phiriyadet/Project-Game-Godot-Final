extends Enemy
class_name shrek,"res://Assets/Shrek-t-post/shrek-t-pose.png"


func _init():
	self.set_atk(3)

func _process(_delta: float):
	
	hitbox.set_damage(self.get_atk())
	hitbox.knockback_direction = velocity.normalized() 
	if animated_sprite.flip_h == true:
		colli.position.x = -5
		hitbox_coll.position.x = -5
	else:
		colli.position.x = 5
		hitbox_coll.position.x = 5
		

