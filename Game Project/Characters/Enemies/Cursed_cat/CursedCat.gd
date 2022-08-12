extends Enemy

class_name cursed_cat,"res://Assets/Cursed_cat/cursed_cat-idle-1.png"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _init():
	self.set_atk(3)

func _process(_delta: float):
	
	hitbox.set_damage(self.get_atk())
	hitbox.knockback_direction = velocity.normalized() 
