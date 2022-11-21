extends Hitbox

#onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)

func _ready():
	pass
	

func _on_Hitbox_area_entered(area):
	area.queue_free()
