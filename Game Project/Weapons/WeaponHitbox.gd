extends Hitbox

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)

func _ready():
	var d  = player.atk + self.damage
	self.damage = d
	print_debug(self.damage)

func _on_Hitbox_area_entered(area):
	area.queue_free()
