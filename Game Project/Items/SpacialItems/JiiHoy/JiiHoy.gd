extends "res://Items/SpacialItems/SpacialItem.gd"


class_name JiiHoy, "res://Assets/Items/Spacial_Items/jiihoy.png"
var player
var heal = preload("res://Items/SpacialItems/JiiHoy/heal.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	player = get_tree().current_scene.get_node("Player").get_child(0)
	
func _on_Area2D_body_entered(body):
	var ani_heal = heal.instance()
	_audio_stream_player_2d.play()
	ani_heal.position = player.global_position + Vector2(0,-50)
	get_parent().get_node("../Player").call_deferred("add_child",ani_heal)
	collision_shape2D.set_deferred("disabled", true)
	body.set_hp(body.get_hp()+50)
	print_debug("JiiHoy add hp", body.get_hp())
	var __ = tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	assert(__)
	__ = tween.interpolate_property(self, "position", position, position + Vector2.UP * 16, 0.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	assert(__)
	__ = tween.start()
	assert(__)
