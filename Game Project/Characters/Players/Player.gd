extends Character

class_name Player


### Automatic References Start ###
onready var _collected_items: GridContainer = $UI/GUI/CollectedItems
onready var _collected_weapons: GridContainer = $UI/GUI/CollectedWeapons
### Automatic References Stop ###


export(float) var pickup_radius  setget set_pickup, get_pickup
export(bool) var spacial_skill = false setget set_sskill, get_sskill

onready var weapons: Node2D = get_node("Weapons")
onready var skills: Node2D = get_node("Skills")
onready var items: Node2D = get_node("Weapons")
onready var picradius:CollisionShape2D = get_node("PickupRadius/CollisionShape2D")
onready var healthBar:TextureProgress = get_node("UI/GUI/HealthBar")
onready var experienceBar:TextureProgress = get_node("UI/GUI/ExpBar")
onready var levelLabel: Label = get_node("UI/GUI/Level")
onready var enemyDesCount : Label= get_node("UI/GUI/EnemyDestroyedCount")
onready var sSkillP: TextureProgress = get_node("UI/GUI/SpacialSkillProgress")
onready var cooldawnTimer:Timer = get_node("CoolDawnTimer")
onready var tween:Tween = get_node("UI/GUI/Tween")

onready var LevelUp = get_node("UI/GUI/LevelUp")
onready var upOp = get_node("UI/GUI/LevelUp/UpgradeOption")
onready var upgradeOp = preload("res://Characters/Players/UpgradeOption.tscn")
onready var collectedItems = preload("res://Characters/Players/GUI/ItemContainer.tscn")

var experience = 0 #exp ที่เก็บไว้/มีอยู่
var experience_level = 1
var collected_experience = 0 #exp ที่เก็บได้ใหม่
var can_active_sSkill: bool = true

var collected_upgrades = []
var upgrade_options = []

func _ready():
	set_healthbar()
	LevelUp.visible = false
	set_expbar(experience, calculate_experiencecap())
	get_skill()
	
func _process(delta):
	set_healthbar()
	enemyDesCount.text = str(Global.enemy_dead_count)
	picradius.shape.radius = self.pickup_radius 
	

	
func get_skill():
	for skill in skills.get_children():
		match  skill.name:
			"Ameno":
				print_debug("have skil Ameno\npickupradius: ",self.pickup_radius)
			"Family":
				print_debug("have skil Fanily\nmax_hp: ",self.max_hp)
			"Gigachad":
				print_debug("have skil Fanily")
			"GottaGoFast":
				print_debug("have skil Fanily")
			"rickroll":
				print_debug("have skil Fanily")
			"ThisIsFine":
				print_debug("have skil Fanily")

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
	
	if Input.is_action_pressed("ui_spacial_skill") and can_active_sSkill:
		can_active_sSkill = false
		cooldawnTimer.start()
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
	levelLabel.text = str("LV. ",experience_level)
	
	var options = 0
	var optionsmax = 3
	while options < optionsmax:
		var option_choice = upgradeOp.instance()
		option_choice.item = get_random_item()
		upOp.add_child(option_choice)
		options += 1
	LevelUp.visible = true
#	LevelUp.show()
	get_tree().paused = true
	
func upgrade_character(upgrade):
#	match upgrade:
#		pass
	adjust_gui_collection(upgrade)
#	var option_children = upgradeOptions.get_children()
#	for i in option_children:
#		i.queue_free()
#	upgrade_options.clear()
#	collected_upgrades.append(upgrade)
#	levelUpContainer.visible = false
#	levelUpContainer.position = Vector2(800,50)
	LevelUp.visible = false
	get_tree().paused = false
	calculate_experience(0)
	
func get_random_item():
	var dblist = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades: #Find already collected upgrades
			pass
		elif i in upgrade_options: #If the upgrade is already an option
			pass
		elif UpgradeDb.UPGRADES[i]["type"] == "item": #Don't pick food
			pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0: #Check for PreRequisites
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collected_upgrades:
					pass
				else:
					dblist.append(i)
		else: #If there are no prequisites
			dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist[rand_range(0,dblist.size()-1)]
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
			var new_item = collectedItems.instantiate()
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
	
func set_sskill(bs):
	spacial_skill = bs
	
func get_sskill():
	return spacial_skill

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


