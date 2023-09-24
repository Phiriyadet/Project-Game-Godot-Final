extends "res://Skills/Skill.gd"

class_name Ameno, "res://Assets/Skills/ameno.png"
var pickup_radius = 5
var old_Lv = 1
var now_Lv = self.level
onready var player_status:  = get_tree().current_scene.get_node("Player").get_child(0)
# Called when the node enters the scene tree for the first time.
func _ready():
#	pickup_radius = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_status  = get_tree().current_scene.get_node("Player").get_child(0)
	now_Lv = self.level
	if old_Lv <= now_Lv:
		player_status.pickup_radius += pickup_radius
		old_Lv+=1


func check_level():
	if player != null:
		pass
#		match level:
#			1,2:
#				player.set_pickup(player.get_pickup() + 10)
#			3,4:
#				player.set_pickup(player.get_pickup() + 25)
#			5,6:
#				player.set_pickup(player.get_pickup() + 40)
#			7:
#				player.set_pickup(player.get_pickup() + 55)


