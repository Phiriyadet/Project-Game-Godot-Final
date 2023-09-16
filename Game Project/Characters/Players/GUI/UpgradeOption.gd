extends ColorRect


onready var lbl_name = $lbl_name
onready var lbl_desription = $lbl_description
onready var lbl_level = $lbl_level
onready var lbl_type = $lbl_type
onready var itemIcon = $ColorRect/ItemIcon

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)

var mouse_over = false
var item = null

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade",player,"upgrade_character")
#	if item == null:
#		item = "food"
	lbl_name.text = UpgradeDb.UPGRADES[item]["displayname"]
	lbl_desription.text = UpgradeDb.UPGRADES[item]["details"]
	lbl_level.text = "level "+ str(UpgradeDb.UPGRADES[item]["level"]+1)
	lbl_type.text = UpgradeDb.UPGRADES[item]["type"]
	itemIcon.texture = load(UpgradeDb.UPGRADES[item]["icon"])
#	print_debug("item icon: ",UpgradeDb.UPGRADES[item]["icon"])

func _on_mouse_entered():
	mouse_over = true
#	print("enter")

func _on_mouse_exited():
	mouse_over = false
#	print("exit")
	
func _input(event):
	
	if event.is_action_pressed("click"):
#		print("i'm here")
#		print_debug("item select:", item)
		if mouse_over:
#			print_debug("item select:", item)
			emit_signal("selected_upgrade", item)

