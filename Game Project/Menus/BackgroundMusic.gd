extends AudioStreamPlayer

onready var local:AudioStream = preload("res://Assets/Audio/Music/local-forecast-slower-by-kevin-macleod-from-filmmusic-io.mp3")
onready var redSun:AudioStream = preload("res://Assets/Audio/Music/tomp3.cc - mao-zedong-propaganda-music-Red-Sun-in-the-Sky.mp3") 
onready var talala:AudioStream = preload("res://Assets/Audio/Music/suisei_talalala.mp3")

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_music_init():
	self.stream = local
	print_debug("set strem local")
	self.playing = true
	print_debug("play local")
	
func change_music_boss():
#	stop()
	self.stream = redSun
	print_debug("set strem red Sun")
	self.playing = true
	print_debug("play red Sun")
	
func change_music_dead():
#	stop()
	self.stream = talala
	print_debug("set strem talala")
	self.playing = true
	print_debug("play talala")
