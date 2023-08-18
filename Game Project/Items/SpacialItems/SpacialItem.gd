extends Node2D


### Automatic References Start ###
onready var _audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
### Automatic References Stop ###


onready var tween = $Area2D/Tween 
onready var collision_shape2D: CollisionShape2D = $Area2D/CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	collision_shape2D.set_deferred("disabled", true)
	
	var __ = tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(__)
	__ = tween.interpolate_property(self, "position", position, position + Vector2.UP * 16, 0.6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(__)
	__ = tween.start()
	assert(__)


func _on_Tween_tween_all_completed():
	queue_free()
