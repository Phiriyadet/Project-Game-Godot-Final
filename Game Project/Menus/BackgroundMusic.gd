extends AudioStreamPlayer

onready var redSun:AudioStream = preload("res://Assets/Audio/Music/tomp3.cc - mao-zedong-propaganda-music-Red-Sun-in-the-Sky.mp3") 

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_music():
#	stop()
	self.stream = redSun
	print_debug("set strem red Sun")
	self.playing = true
	print_debug("play red Sun")
