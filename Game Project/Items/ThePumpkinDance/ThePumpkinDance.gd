extends "res://Items/Item.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name ThePumpkinDance, "res://Assets/Items/pumpkin_dance-5.png"

onready var cooldown_timer = $CoolDownTimer
onready var appearance_timer = $AppearanceTimer

var center: Vector2 = Vector2.ZERO
var radius: float = 0.0
var speed: float = 1.0
var angle: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	appearance_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle += speed * delta
	radius = clamp(radius+1, 0, 100)
	var x = center.x + radius * cos(angle)
	var y = center.y + radius * sin(angle)
	position = Vector2(x, y)





func _on_CoolDownTimer_timeout():
	appearance_timer.start()
	self.visible = true
	


func _on_AppearanceTimer_timeout():
	cooldown_timer.start()
	self.visible = false
