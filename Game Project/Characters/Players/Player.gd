extends Character

class_name Player


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

var experience = 0 #exp ที่เก็บไว้/มีอยู่
var experience_level = 1
var collected_experience = 0 #exp ที่เก็บได้ใหม่
var can_active_sSkill: bool = true

func _ready():
	set_healthbar()
	LevelUp.hide()
	
	set_expbar(experience, calculate_experiencecap())
	
func _process(delta):
	set_healthbar()
	enemyDesCount.text = str(Global.enemy_dead_count)
	picradius.shape.radius = self.pickup_radius 

	
				
func get_skill():
	for skill in skills.get_children():
		match  skill.name:
			"Ameno":
				self.pickup_radius += skill.pickup_radius
				
			"Family":
				self.max_hp += skill.max_hp
	

func get_input():
	
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
		LevelUp.visible = true
		get_tree().paused = true
		
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
	LevelUp.show()
	get_tree().paused = true
	
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


func _on_TextureButton_pressed():
	LevelUp.hide()
	get_tree().paused = false
