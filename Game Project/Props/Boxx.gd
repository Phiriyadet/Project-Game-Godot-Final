extends StaticBody2D

var Giorno = preload("res://Items/SpacialItems/Giorno\'sPiano/Giorno\'sPiano.tscn")
var TimeStop = preload("res://Items/SpacialItems/It\'sTimeToStop/It\'sTimeToStop.tscn")
var JiiHoy = preload("res://Items/SpacialItems/JiiHoy/JiiHoy.tscn")
onready var loot = get_node("../../Loot") 

onready var player := get_tree().current_scene.get_node("Player").get_child(0)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	player = get_tree().current_scene.get_node("Player").get_child(0)
	var posi_player = player.global_position
	if (position.x-posi_player.x) > 1500 or (position.x-posi_player.x) < -1500:
		queue_free()
		Global.countBoxs -= 1
	elif (position.y-posi_player.y) > 1000 or (position.y-posi_player.y) < -1000:
		queue_free()
		Global.countBoxs -= 1


func _on_Area2D_area_entered(area):
	queue_free()
	

func _on_HitBox_area_entered(area):
	$Timer.start()
	$HitBox/CollisionShape2D.disabled
	$".".hide()


func _on_Timer_timeout():
	$".".show()
	$Timer2.start()


func _on_Timer2_timeout():
	$".".hide()
	var g = Giorno.instance()
	var T = TimeStop.instance()
	var J = JiiHoy.instance()
	var random_number = randi() % 15 + 1
	print(loot.name)
	if random_number == 1:
		g.position = position
		loot.call_deferred("add_child", g)
	if random_number == 2:
		T.position = position
		loot.call_deferred("add_child", T)
	if random_number >= 3 and random_number <= 6:
		J.position = position
		loot.call_deferred("add_child", J)
	queue_free()
