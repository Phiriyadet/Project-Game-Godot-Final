extends Character

class_name Player


export(float) var pickup_radius  setget set_pickup, get_pickup

onready var weapons: Node2D = get_node("Weapons")
onready var skills: Node2D = get_node("Skills")
onready var items: Node2D = get_node("Weapons")
onready var picradius:CollisionShape2D = get_node("PickupRadius/CollisionShape2D")
onready var healthBar:TextureProgress = get_node("CanvasLayer/GUI/HealthBar")
onready var experienceBar:TextureProgress = get_node("CanvasLayer/GUI/ExpBar")
onready var levelLabel: Label = get_node("CanvasLayer/GUI/Level")

var experience = 0 #exp ที่เก็บไว้/มีอยู่
var experience_level = 1
var collected_experience = 0 #exp ที่เก็บได้ใหม่

func _ready():
	set_healthbar()
	set_expbar(experience, calculate_experiencecap())
	
func _process(delta):
	set_healthbar()
#	picradius.shape.radius = self.pickup_radius 
#	print(picradius.shape.radius)
	for skill in skills.get_children():
		match  skill.name:
			"Ameno":
				skill.level_skill
#				print_debug(skill.picup_radius)
	

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
	
func calculate_experience(gem_exp): #คำนวน exp ที่เก็บได้
	var exp_required = calculate_experiencecap()
	collected_experience += gem_exp
	if experience + collected_experience >= exp_required: #level up
		collected_experience -= exp_required-experience #
		experience_level += 1
		experience = 0
		exp_required = calculate_experiencecap()
		levelup()
	else:
		experience += collected_experience
		collected_experience = 0

	set_expbar(experience, exp_required)

func calculate_experiencecap():#คำนวน exp ที่ต้องการในการอัพเลเวล
	var exp_cap = experience_level
#	if experience_level < 20:
#		exp_cap = experience_level*5
#	elif exp_cap < 40:
#		exp_cap = 95 + (experience_level-19)*8
#	else:
#		exp_cap = 255 + (experience_level-39)*12
	return exp_cap * 5

func set_expbar(set_value = 1, set_max_value = 100):
	experienceBar.value = set_value
	experienceBar.max_value = set_max_value			

func set_healthbar():
	healthBar.max_value = self.max_hp
	healthBar.value = self.hp
	
func levelup():
	levelLabel.text = str("LV. ",experience_level)
	
func gameover():
	pass
		
func set_pickup(new_pick):
	pickup_radius = new_pick

func get_pickup():
	return pickup_radius


func _on_PickupRadius_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self


func _on_CollectArea_area_entered(area):
	if area.is_in_group("loot"):
		var gem_exp = area.grab() 
		calculate_experience(gem_exp)


func _on_Player_hp_changed(new_hp):
	set_healthbar()
#	healthBar.value = new_hp
