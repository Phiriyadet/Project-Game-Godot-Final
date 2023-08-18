extends "res://Items/SpacialItems/SpacialItem.gd"


class_name ItsTimeToStop ,"res://Assets/Items/Spacial_Items/it's_time_to_stop.png"
onready var player := get_tree().current_scene.get_node("Player").get_child(0)
var ice = preload("res://Items/SpacialItems/It\'sTimeToStop/Ice_Ef.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	player = get_tree().current_scene.get_node("Player").get_child(0)

func _on_Area2D_body_entered(body):
	var ice_ef = ice.instance()
	ice_ef.position = player.global_position + Vector2(-100,0)
	$AudioStreamPlayer2D.play()
	get_parent().call_deferred("add_child", ice_ef)
	collision_shape2D.set_deferred("disabled", true)
	Global.time_stop = 1
#	for enemy in get_tree().current_scene.get_node("Enemies").get_children():
#		enemy.set_spd(0)

	var __ = tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	assert(__)
	__ = tween.interpolate_property(self, "position", position, position + Vector2.UP * 16, 0.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	assert(__)
	__ = tween.start()
	assert(__)

