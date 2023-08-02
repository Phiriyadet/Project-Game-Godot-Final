extends "res://Items/Item.gd"

class_name ThePumpkinDance, "res://Assets/Items/pumpkin_dance-5.png"


### Automatic References Start ###
onready var _collision2d: CollisionShape2D = $Area2D/CollisionShape2D
### Automatic References Stop ###

onready var cooldown_timer = $CoolDownTimer
onready var appearance_timer = $AppearanceTimer

var wait_time = 0.0

var center: Vector2 = Vector2.ZERO
var radius: float = 0.0
var speed: float = 1.0
var angle: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
#	self.visible = false
	start_cooldown() # Start the cooldown timer initially


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle += speed * delta

	# คำนวณระยะทางใหม่ของลูกบอลที่ควรอยู่
	var new_x = center.x + radius * cos(angle)
	var new_y = center.y + radius * sin(angle)

	# ตั้งค่าตำแหน่งใหม่ให้กับลูกบอล
	position = Vector2(new_x, new_y)

	# หากกลับมาอยู่ที่จุดศูนย์กลางให้กลับความเร็วให้เป็นบวกเพื่อให้ลูกบอลหมุนไปทางซ้ายอีกครั้ง
	if radius >= 100:
		speed *= -1

	# หากกลับมาอยู่ที่จุดศูนย์กลางให้นับเวลารอคูลดาวน์
	if radius <= 0:
		start_cooldown()
	

func check_level():
	match level:
		1,2:
			wait_time += 5.0
		3,4:
			wait_time += 8.0
		5,6:
			wait_time += 11.0
		7:
			wait_time += 14.0

func start_cooldown():
	appearance_timer.wait_time = wait_time
	cooldown_timer.start()
#	print_debug("Appearance. Wait time:", wait_time)

func _on_CoolDownTimer_timeout():
	appearance_timer.start()
	self.visible = true
	_collision2d.disabled = false
	

func _on_AppearanceTimer_timeout():
	cooldown_timer.start()
	self.visible = false
	_collision2d.disabled = true


func _on_Area2D_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self
