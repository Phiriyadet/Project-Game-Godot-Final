extends "res://Characters/Enemies/Enemy.gd"


class_name PopCat, "res://Assets/Characters/Enemies/Pop_cat/pop_cat-1.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if Global.gio_take_dm == 1:
		self.take_damage(2000, Vector2.ZERO, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
