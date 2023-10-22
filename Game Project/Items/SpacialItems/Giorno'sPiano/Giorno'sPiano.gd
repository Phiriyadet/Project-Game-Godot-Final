extends "res://Items/SpacialItems/SpacialItem.gd"


class_name GiornosPiano, "res://Assets/Items/Spacial_Items/Giorno's_Piano.png"
var jojo_ef = preload("res://Items/SpacialItems/Giorno\'sPiano/Jojo_Ef.tscn")
var player 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	player = get_tree().current_scene.get_node("Player").get_child(0)
	var jojo = jojo_ef.instance()
	jojo.position = player.global_position - Vector2(500,200)
	jojo.get_node("AudioStreamPlayer2D").volume_db = $AudioStreamPlayer2D.volume_db
	get_parent().call_deferred("add_child", jojo)
	Global.gio_take_dm = 1
	collision_shape2D.set_deferred("disabled", true)
	for enemy in get_tree().current_scene.get_node("Enemies").get_children():
		enemy.take_damage(3000, Vector2.ZERO, 0)
	var __ = tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(__)
	__ = tween.interpolate_property(self, "position", position, position + Vector2.UP * 16, 0.6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(__)
	__ = tween.start()
	assert(__)
	$Timer.start()


func _on_Timer_timeout():
	Global.gio_take_dm = 0
