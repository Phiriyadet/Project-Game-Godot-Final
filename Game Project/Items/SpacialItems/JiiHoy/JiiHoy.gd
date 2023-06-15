extends "res://Items/SpacialItems/SpacialItem.gd"


class_name JiiHoy, "res://Assets/Items/Spacial_Items/jiihoy.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	collision_shape2D.set_deferred("disabled", true)
	body.set_hp(body.get_hp()+50)
	print_debug("JiiHoy add hp", body.get_hp())
	var __ = tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(__)
	__ = tween.interpolate_property(self, "position", position, position + Vector2.UP * 16, 0.6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(__)
	__ = tween.start()
	assert(__)
