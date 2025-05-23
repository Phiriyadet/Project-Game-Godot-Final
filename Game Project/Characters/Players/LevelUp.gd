extends Panel


var mouse_over = false
onready var upOpGUI = $UpgradeOption

var upgrade_options = []
onready var upgradeOpScene = preload("res://Characters/Players/GUI/UpgradeOption.tscn")

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)
# Called when the node enters the scene tree for the first time.

#signal selected_upgrade(upgrade)
#func _ready():
#	connect("selected_upgrade",player,"upgrade_character")
func levelup():
	var option_children = upOpGUI.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()	
	var options = 0
	var optionsmax = 3
	var itemCheck = []
	var fff = []
	var hhh = ""
	var itemLike = 0
	while options < optionsmax:
		var option_choice = upgradeOpScene.instance()
		var random_item = get_random_item()
		var checkLevel = UpgradeDb.UPGRADES[random_item]["level"]
		var checkType = UpgradeDb.UPGRADES[random_item]["type"]
		if checkType=="weapon" and Global.countWeapon >= 4 and not random_item in Global.list_W_S:
			continue
		if checkType=="item" and Global.countItem >= 4 and not random_item in Global.list_W_S:
			continue
		if checkType!="skill" and checkLevel >=7:
			continue
		if fff.has(random_item):
			itemLike = 1
		else:
			itemLike = 0

		fff.append(random_item)

		if itemLike == 0:
			itemCheck = random_item
			option_choice.item = random_item
			upOpGUI.add_child(option_choice)
			options += 1
	self.visible = true
	Global.upgrade_options_close = false
	
func get_random_item():
	var dblist = []
	var collected_weapon_count = 0
	var collected_item_count = 0
	var collected_upgrades = Global.collected_allitem
	for collected_upgrade in collected_upgrades:
		var collected_upgrade_type = UpgradeDb.UPGRADES[collected_upgrade]["type"]
		if collected_upgrade_type == "weapon":
			collected_weapon_count += 1
		elif collected_upgrade_type == "item":
			collected_item_count += 1
	
	for i in UpgradeDb.UPGRADES:
		dblist.append(i)
#		if i in collected_upgrades:
#			if not i in dblist:
#				dblist.append(i)
###				print("i in collected_upgrades")
##		elif i in upgrade_options:
##			if not i in dblist:
##				dblist.append(i)
##				print("i in upgrade_options")
#		if UpgradeDb.UPGRADES[i]["type"] == "skill":
#			dblist.append(i)	
#		elif UpgradeDb.UPGRADES[i]["type"] == "weapon" and collected_weapon_count < 4 :
#			dblist.append(i)
#		elif UpgradeDb.UPGRADES[i]["type"] == "item" and collected_item_count < 4 :
#			dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist[rand_range(0, dblist.size())]
		upgrade_options.append(randomitem)
		return randomitem
	else:
		return null
