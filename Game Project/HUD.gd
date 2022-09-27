extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var time := $"%Time" as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_time(t):
	var secs = fmod(t,60)
	var mins = fmod(t,60*60)/60
	time.text = "%02d : %02d"%[mins,secs]
#	print(time.text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
