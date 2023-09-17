extends Node2D

class_name Skill


### Automatic References Start ###
onready var _audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
### Automatic References Stop ###

onready var player: Player = get_tree().current_scene.get_node("Player").get_child(0) as Player

export(int) var level = 0 setget set_newlevel, get_level

# Called when the node enters the scene tree for the first time.
func _ready():
#	check_level()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_newlevel(old_level:int):
	level = old_level+1
	check_level()
	
func get_level() -> int:
	return level
	
func check_level():
	if player != null:
#		match self.level:
#			1,2:
#				print_debug("skill level :", level)
#			3,4:
#				print_debug("skill level :", level)
#			5,6:
#				print_debug("skill level :", level)
#			7:
#				print_debug("skill level :", level)
		_audio_stream_player_2d.play()


func _on_AudioStreamPlayer2D_finished():
	_audio_stream_player_2d.stop()
