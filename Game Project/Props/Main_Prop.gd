extends StaticBody2D

var giorno = preload("res://Items/SpacialItems/Giorno\'sPiano/Giorno\'sPiano.tscn")
var timeStop = preload("res://Items/SpacialItems/It\'sTimeToStop/It\'sTimeToStop.tscn")
var jiiHoy = preload("res://Items/SpacialItems/JiiHoy/JiiHoy.tscn")
#onready var loot = get_node("../../Loot") 
onready var loot = get_tree().current_scene.get_node("Loot")

func _ready():
	pass # Replace with function body.

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
	var g = giorno.instance()
	var T = timeStop.instance()
	var J = jiiHoy.instance()
	var random_number = randi() % 15 + 1
#	print(loot.name)
#	if random_number == 1:
#		g.position = position
#		loot.call_deferred("add_child", g)
#	if random_number == 2:
#		T.position = position
#		loot.call_deferred("add_child", T)
#	if random_number >= 3 and random_number <= 6:
#		J.position = position
#		loot.call_deferred("add_child", J)
	queue_free()
