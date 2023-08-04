extends Node2D

var eXp = []
var eXpnum = 1
var onec = 0
var move_to = Vector2.ZERO
var posi_exp = false
onready var player := get_tree().current_scene.get_node("Player").get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("dance")
	$Dis_ADEXP.start()
	$Sprite.hide()

func _physics_process(delta):
	player = get_tree().current_scene.get_node("Player").get_child(0)
	if (position.x-player.get_global_position().x) > 800 or (position.x-player.get_global_position().x) < -800 or (position.y-player.get_global_position().y) > 800 or (position.y-player.get_global_position().y) < -800:
#		eXp.clear()
#		eXpnum += 1
		move_to = Vector2.ZERO
		$Sprite.hide()
		position = player.get_global_position()
	
	if posi_exp == true:
		$Sprite.show()
		position += move_to*Global.speed_pumpkin

	if eXp.size() == 1:
		var expp = get_random_exp()
		move_to = global_position.direction_to(expp)
		onec+=1
		
func get_random_exp():
	if eXp.size() > 0:
		var ran = eXp[randi() % eXp.size()].get_global_position()
		return ran
	else:
		return Vector2.UP	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_Detect_Exp_area_entered(area):
	if !eXp.has(area):
		if eXpnum > 0:
			eXp.append(area)
			eXpnum-=1


func _on_Area_Detect_Exp_area_exited(area):
	if eXp.has(area):
		eXp.erase(area)
		eXpnum += 1
	
	
func _on_Area_Move_Exp_To_Player_area_entered(area):
	area.position = player.get_global_position()
	posi_exp = false
	if eXp.has(area):
		eXp.erase(area)
		eXpnum += 1

func _on_Dis_ADEXP_timeout():
	$Sprite/Area_Detect_Exp/CollisionShape2D.disabled = true
	$Un_Dis_ADEXP.start()

func _on_Un_Dis_ADEXP_timeout():
	$Sprite/Area_Detect_Exp/CollisionShape2D.disabled = false
	posi_exp = true
	$Dis_ADEXP.start()
