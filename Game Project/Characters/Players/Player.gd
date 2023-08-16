extends Character

class_name Player


### Automatic References Start ###
onready var _change_new_upgrade: Panel = $UI/GUI/ChangeNewUpgrade
onready var _collected_items: GridContainer = $UI/GUI/CollectedItems
onready var _collected_upgrades_box: VBoxContainer = $UI/GUI/ChangeNewUpgrade/ChangeContainer/SelectContainer/CollectedUpgrades
onready var _collected_weapons: GridContainer = $UI/GUI/CollectedWeapons
onready var _new_upgrade_box: VBoxContainer = $UI/GUI/ChangeNewUpgrade/ChangeContainer/SelectContainer/NewUpgrade
### Automatic References Stop ###


export(float) var pickup_radius = 20 setget set_pickup, get_pickup
export(bool) var spacial_skill = false setget set_sskill, get_sskill
export(bool) var buy_spacial_skill = false setget set_buy_sskill, get_buy_sskill
export(int) var collected_coin = 0 setget set_collectedCoin, get_collectedCoin

onready var weapons: Node2D = get_node("Weapons")
onready var skills: Node2D = get_node("Skills")
onready var items: Node2D = get_node("Items")

onready var collision2d = get_node("CollisionShape2D")
onready var picradius:CollisionShape2D = get_node("PickupRadius/CollisionShape2D")
onready var healthBar:TextureProgress = get_node("UI/GUI/HealthBar")
onready var experienceBar:TextureProgress = get_node("UI/GUI/ExpBar")
onready var levelLabel: Label = get_node("UI/GUI/Level")
onready var enemyDesCount : Label= get_node("UI/GUI/EnemyDestroyedCount")
onready var sSkillP: TextureProgress = get_node("UI/GUI/SpacialSkillProgress")
onready var cooldawnTimer:Timer = get_node("CoolDawnTimer")
onready var tween:Tween = get_node("UI/GUI/Tween")
onready var popup:Popup = get_node("UI/GUI/Popup")
onready var animationPlayer: AnimationPlayer = get_node("AnimationPlayer") 
onready var popup_countdown_timer :Timer = get_node("UI/GUI/Popup/CountDownTimer")

onready var LevelUp = get_node("UI/GUI/LevelUp")
onready var upOpGUI = get_node("UI/GUI/LevelUp/UpgradeOption")
onready var upgradeOpScene = preload("res://Characters/Players/GUI/UpgradeOption.tscn")
onready var collectedItemsScene = preload("res://Characters/Players/GUI/ItemContainer.tscn")
onready var collet_wis = preload("res://Characters/Players/GUI/CollectedWIS.tscn")



var experience = 0 #exp ที่เก็บไว้/มีอยู่
var experience_level = 1
var collected_experience = 0 #exp ที่เก็บได้ใหม่
var can_active_sSkill: bool = true
var check_can_take_damage: bool = true

var max_weapon_upgrades = 4
var max_item_upgrades = 4
var collected_upgrades = []
var upgrade_options = []

var type_upgrade
var old_upgrade
var new_upgrade

func _ready():
	Global.open_chest = 0
	set_healthbar()
	LevelUp.visible = false
	set_expbar(experience, calculate_experiencecap())
	
	
	
func _process(delta):
	if Global.open_chest==1:
		levelup()
	set_healthbar()
	if check_can_take_damage:
		collision2d.disabled = false
	else:
		collision2d.disabled = true
	enemyDesCount.text = str(Global.enemy_dead_count)
	picradius.shape.radius = self.pickup_radius 
	

func get_input():
	
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
		
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
#		animated_sprite.flip_h  = true

	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
#		animated_sprite.flip_h  = false

	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
		
	print_debug("sskill value in player:", spacial_skill)	
	if Input.is_action_pressed("ui_spacial_skill") and can_active_sSkill and spacial_skill:
		can_active_sSkill = false
		cooldawnTimer.start()
		animationPlayer.play("spacial_attack")
		recharge_sskill(cooldawnTimer.wait_time)
		

func recharge_sskill(time:float):
#	sSkillP.value
	var __ = tween.interpolate_property(sSkillP, "value", 100, 0, time)
	assert(__)
	__ = tween.start()
	assert(__)
			
func calculate_experience(gem_exp): #คำนวน exp ที่เก็บได้
	var exp_required = calculate_experiencecap()
	collected_experience += gem_exp
	if experience + collected_experience >= exp_required: #level up
		collected_experience -= exp_required-experience #
		experience_level += 1
		Global.level_player = experience_level
		experience = 0
		exp_required = calculate_experiencecap()
		levelup()
	else:
		experience += collected_experience
		collected_experience = 0

	set_expbar(experience, exp_required)

func calculate_experiencecap():#คำนวน exp ที่ต้องการในการอัพเลเวล
	var exp_cap = experience_level
	if experience_level < 20:
		exp_cap = experience_level*5
	elif exp_cap < 40:
		exp_cap = 95 + (experience_level-19)*8
	else:
		exp_cap = 255 + (experience_level-39)*12
	return exp_cap * 2

func set_expbar(set_value = 1, set_max_value = 100):
	experienceBar.value = set_value
	experienceBar.max_value = set_max_value			

func set_healthbar():
	healthBar.max_value = self.max_hp
	healthBar.value = self.hp
	
func levelup():
	Global.open_chest=0
	levelLabel.text = str("LV. ",experience_level)
	
	var options = 0
	var optionsmax = 3
#	while options < optionsmax:
#		var option_choice = upgradeOpScene.instance()
#		option_choice.item = get_random_item()
#		upOpGUI.add_child(option_choice)
#		options += 1
	var itemCheck = []
	var fff = []
	var hhh = ""
	var itemLike = 0
	while options < optionsmax:
		var option_choice = upgradeOpScene.instance()
		var random_item = get_random_item()
		if fff.has(random_item):
			itemLike = 1
		else:
			itemLike = 0
		fff.append(random_item)
#		while random_item in upgrade_options:
#			random_item = get_random_item()
		
		if itemLike == 0:
			itemCheck = random_item
			option_choice.item = random_item
			upOpGUI.add_child(option_choice)
			options += 1
	LevelUp.visible = true
#	LevelUp.show()
	get_tree().paused = true

func popup_collected_full(upgrade, type):
	popup.show()
	popup_countdown_timer.start()
#	var children = _collected_upgrades_box.get_children()
#	for i in children:
#		i.queue_free()
#
#	children = _new_upgrade_box.get_children()
#	for i in children:
#		i.queue_free()
##	_collected_upgrades_box.remove_children()  # Clear the box before adding new children
#
#	var collected_item = collet_wis.instance()
#	collected_item.item = upgrade
#	new_upgrade = upgrade
#	type_upgrade = type
#	_new_upgrade_box.add_child(collected_item)
#
#	for collected_upgrade in collected_upgrades:
#		var collected_upgrade_type = UpgradeDb.UPGRADES[collected_upgrade]["type"]
#		if collected_upgrade_type == type:
#			collected_item = selectNewUpgrade.instance()
#			collected_item.item = collected_upgrade
#			_collected_upgrades_box.add_child(collected_item)
#
#	_change_new_upgrade.show()

	
func select_old_upgrade(o_up):
#	_change_new_upgrade.old_upgrade = old_upgrade
	old_upgrade = o_up
	
func print_debug_upgrade(upgrade, instance):
	print_debug("upgrade: ", upgrade, ":", instance.get_level())
	
func increase_dataLevel_upgrade(upgrade):
	var currentLevel = UpgradeDb.UPGRADES[upgrade]["level"]
	var newLevel = clamp(currentLevel + 1, 1, 7)
	UpgradeDb.UPGRADES[upgrade]["level"] = newLevel
		
func upgrade_character(upgrade):
	var instance
	var icon_pass
	var upgrade_scenes = UpgradeDb.UPGRADE_SCENES
	
	match upgrade:
		# Weapon upgrades
		"BonkBat", "BonkMissile", "GunHand", "Nokia3310", "Punch", "TwoGuitars":
			var weapon_name = upgrade
			var type = "weapon"
			if not weapons.has_node(weapon_name):
#				print_debug("weapons:", weapons.get_child_count())
			
				if weapons.get_child_count() != 4:
					# Create a new instance of the weapon upgrade
					instance = upgrade_scenes[weapon_name].instance()
					weapons.add_child(instance)
					adjust_gui_collection(upgrade)
					increase_dataLevel_upgrade(upgrade)
#					icon_pass = true
				else:
					popup_collected_full(upgrade, type)  # Display a message for full upgrades
			else:
				instance = weapons.get_node(weapon_name)
				instance.set_newlevel(instance.get_level())
				increase_dataLevel_upgrade(upgrade)
			
		# Skill upgrades
		"Ameno", "Family", "Gigachad", "GottaGoFast", "Rickroll", "ThisIsFine":
			var skill_name = upgrade
			if not skills.has_node(skill_name):
				# Create a new instance of the skill upgrade
				instance = upgrade_scenes[skill_name].instance()
				skills.add_child(instance)
				increase_dataLevel_upgrade(upgrade)
			else:
				instance = skills.get_node(skill_name)
				instance.set_newlevel(instance.get_level())
				increase_dataLevel_upgrade(upgrade)
			
		# Item upgrades
		"Amogus", "NanomachinesSon", "SuezCanalJam", "TakeMyMoney", "TheMotivation", "ThePumpkinDance":
			var item_name = upgrade
			var type = "item"
			if not items.has_node(item_name):
#				print_debug("items:", items.get_child_count())
				
				if items.get_child_count() != 4:
					# Create a new instance of the item upgrade
					instance = upgrade_scenes[item_name].instance()
					items.add_child(instance)
					adjust_gui_collection(upgrade)
					increase_dataLevel_upgrade(upgrade)
#					icon_pass = true
				else:
					popup_collected_full(upgrade, type)  # Display a message for full upgrades
			else:
				instance = items.get_node(item_name)
				instance.set_newlevel(instance.get_level())
				increase_dataLevel_upgrade(upgrade)

#	if icon_pass:
#	adjust_gui_collection(upgrade)

	var option_children = upOpGUI.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	if not collected_upgrades.has(upgrade):
		collected_upgrades.append(upgrade)
			
	Global.collected_allitem = collected_upgrades
	LevelUp.visible = false
	get_tree().paused = false
	calculate_experience(0)


	
func get_random_item():
	var dblist = []
	var collected_weapon_count = 0
	var collected_item_count = 0
	for collected_upgrade in collected_upgrades:
		var collected_upgrade_type = UpgradeDb.UPGRADES[collected_upgrade]["type"]
		if collected_upgrade_type == "weapon":
			collected_weapon_count += 1
		elif collected_upgrade_type == "item":
			collected_item_count += 1
	
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades:
			if not i in dblist:
				dblist.append(i)
				print("i in collected_upgrades")
		elif i in upgrade_options:
			if not i in dblist:
				dblist.append(i)
				print("i in upgrade_options")
		elif UpgradeDb.UPGRADES[i]["type"] == "skill":
			dblist.append(i)	
		elif UpgradeDb.UPGRADES[i]["type"] == "weapon" and collected_weapon_count < 4 and not i in collected_upgrades:
			dblist.append(i)
			print("i is weapon")
		elif UpgradeDb.UPGRADES[i]["type"] == "item" and collected_item_count < 4 and not i in collected_upgrades:
			dblist.append(i)
			print("i is weapon")
		
		
	
	if dblist.size() > 0:
		var randomitem = dblist[rand_range(0, dblist.size() - 1)]
		upgrade_options.append(randomitem)
		return randomitem
	else:
		return null



func adjust_gui_collection(upgrade):
	var get_upgraded_displaynames = UpgradeDb.UPGRADES[upgrade]["displayname"]
	var get_type = UpgradeDb.UPGRADES[upgrade]["type"]
	if get_type != "skill":
		var get_collected_displaynames = []
		for i in collected_upgrades:
			get_collected_displaynames.append(UpgradeDb.UPGRADES[i]["displayname"])
		if not get_upgraded_displaynames in get_collected_displaynames:
			var new_item = collectedItemsScene.instance()
			new_item.upgrade = upgrade
			match get_type:
				"weapon":
					_collected_weapons.add_child(new_item)
				"item":
					_collected_items.add_child(new_item)


func gameover():
	print("Game Over")

func set_pickup(new_pick):
	pickup_radius = new_pick

func get_pickup():
	return pickup_radius
	
func set_sskill(ss):
	spacial_skill = ss
	
func get_sskill():
	return spacial_skill

func set_buy_sskill(bss):
	buy_spacial_skill = bss
	
func get_buy_sskill():
	return buy_spacial_skill
		
func set_collectedCoin(cc):
	collected_coin = cc

func get_collectedCoin():
	return collected_coin

func _on_PickupRadius_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

func _on_CollectArea_area_entered(area):
	if area.is_in_group("loot"):
		var gem_exp = area.grab() 
		calculate_experience(gem_exp)

func _on_Player_hp_changed():
	set_healthbar()
#	healthBar.value = new_hp

func _on_CoolDawnTimer_timeout():
	can_active_sSkill = true

func _on_CountDownTimer_timeout():
	popup.hide()


