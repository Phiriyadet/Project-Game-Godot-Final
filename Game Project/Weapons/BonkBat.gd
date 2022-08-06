extends Weapon

class_name BonkBat, "res://Assets/Weapon/bat.png"

#onready var player = get_tree().current_scene.get_node("Player").get_child(0)
#onready var t = get_node("CanvasLayer/Label")
var i = 0
var flip = false setget set_flip,get_flip

# Called when the node enters the scene tree for the first time.
func _ready():
	self.flip = false
	cool_down_timer.start()
	
func _process(delta):
	if flip:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false

func attack():
	animation_player.play("attack")
	self.flip = true
	


func _on_CoolDownTimer_timeout():
	attack()
func set_flip(new_flip):
	flip = new_flip
func get_flip():
	return flip
