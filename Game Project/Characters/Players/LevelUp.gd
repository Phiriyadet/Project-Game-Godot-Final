extends Panel


var mouse_over = false
onready var UpOp = $UpgradeOption

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)
# Called when the node enters the scene tree for the first time.

#signal selected_upgrade(upgrade)
#func _ready():
#	connect("selected_upgrade",player,"upgrade_character")
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#
#
#func _on_LevelUp_mouse_entered():
#	mouse_over = true
##	print("enter")
#
#
#func _on_LevelUp_mouse_exited():
#	mouse_over = false
##	print("exit")
	
#func _input(event):
#	if event.is_action_pressed("click"):
##		print_debug("item select:", item)
#		if mouse_over:
#			print_debug("item select:", item)
#			emit_signal("selected_upgrade", item)
