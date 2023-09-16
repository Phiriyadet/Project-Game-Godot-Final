extends "res://Items/Item.gd"


class_name TheMotivation, "res://Assets/Items/chair.png"

var slow = 0.0
var old_spd
var old_Lv = 1
var now_Lv = self.level

var stored_data = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(self.level)
	now_Lv = self.level
	if old_Lv < now_Lv:
		$Node2D.scale.x +=0.2
		$Node2D.scale.y +=0.2
		$cooldown.wait_time -= 0.7
		$set_spd_old.wait_time = 2 + slow
		old_Lv+=1

func check_level():
	match level:
		2:
			slow += 0.1
		3,4:
			slow += 0.2
		5,6:
			slow += 0.3
		7:
			slow += 0.4

var processed_bodies = {}

func _on_Area2D_body_entered(body):
	if body != null and not processed_bodies.has(body):
		old_spd = body.get_spd()

		# Store the body and old_spd in the dictionary
		processed_bodies[body] = old_spd
		
		# Start the Timer (if needed)
		$set_spd_old.start()
		
		# Modify the body's speed (e.g., slow it down) only if it's not null
		if body != null:
			body.set_spd(1) # You can adjust this to the desired modification

func _on_set_spd_old_timeout():
	# Iterate through the processed bodies and reset their speeds
	for body in processed_bodies.keys():
		var old_spd = processed_bodies[body]
		if is_instance_valid(body):
			body.set_spd(old_spd)

	# Clear the processed_bodies dictionary after resetting speeds
	processed_bodies.clear()
	
func _on_cooldown_timeout():
	$AnimationPlayer.play("spin")
