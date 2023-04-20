extends Control

var _save := SaveGameAsJson.new()
#onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label")
onready var coinL:Label = $ColorRect/CoinContainer/coinL
onready var hpL = $ColorRect/Panel/HBoxContainer/StatusContainer/hpL
onready var atkL = $ColorRect/Panel/HBoxContainer/StatusContainer/atkL
onready var spdL = $ColorRect/Panel/HBoxContainer/StatusContainer/spdL
onready var prL = $ColorRect/Panel/HBoxContainer/StatusContainer/prL
onready var ssL = $ColorRect/Panel/HBoxContainer/StatusContainer/ssL
onready var playBtn:Button = get_node("PlayBtn") 
onready var players_cont = $ColorRect/PlayersContainer
onready var doge_btn = $ColorRect/PlayersContainer/VBoxContainer/DogTextureRect
onready var monkey_btn = $ColorRect/PlayersContainer/VBoxContainer2/MonkeyTextureRect
onready var frog_btn = $ColorRect/PlayersContainer/VBoxContainer3/FrogTextureRect

var hp_d = 0
var atk_d = 0
var spd_d = 0
var pr_d = 0
var ss_d = false

var hp_m=0
var atk_m=0
var spd_m=0
var pr_m=0
var ss_m=false

var hp_f=0
var atk_f=0
var spd_f=0
var pr_f=0
var ss_f=false

# Called when the node enters the scene tree for the first time.
func _ready():
	doge_btn.self_modulate = Color(0,0,0,1)
	monkey_btn.self_modulate = Color(0,0,0,1)
	frog_btn.self_modulate = Color(0,0,0,1)
	# disable play button when the scene is loaded
	
	playBtn.disabled = true
	# set global variable enemy_dead_count to 0
	Global.enemy_dead_count = 0
	_create_or_load_save()
	
func _create_or_load_save():
	if _save.save_exists():
		_save.load_savegame()
	else:
		_save.write_savegame_init()

	# หลังจากสร้างหรือโหลดทรัพยากรที่บันทึกแล้ว เราจำเป็นต้องส่งข้อมูลไปยังโหนดต่างๆ ที่ต้องการ
	
	coinL.text = str(_save.num_coin)
	hp_d = _save.Dog.hp 
	atk_d = _save.Dog.atk
	spd_d = _save.Dog.spd
	pr_d = _save.Dog.pickup_radius
	ss_d = _save.Dog.spacial_skill

	hp_m = _save.Monkey.hp
	atk_m = _save.Monkey.atk
	spd_m = _save.Monkey.spd
	pr_m = _save.Monkey.pickup_radius
	ss_m = _save.Monkey.spacial_skill

	hp_f = _save.Frog.hp
	atk_f = _save.Frog.atk
	spd_f = _save.Frog.spd
	pr_f = _save.Frog.pickup_radius
	ss_f = _save.Frog.spacial_skill
	


func _save_game():
	_save.num_coin = int(coinL.text)
	
	_save.Dog.hp = hp_d
	_save.Dog.atk = atk_d
	_save.Dog.spd = spd_d
	_save.Dog.pickup_radius = pr_d
	_save.Dog.spacial_skill = ss_d

	_save.Monkey.hp = hp_m
	_save.Monkey.atk = atk_m
	_save.Monkey.spd = spd_m
	_save.Monkey.pickup_radius = pr_m
	_save.Monkey.spacial_skill = ss_m

	_save.Frog.hp = hp_f
	_save.Frog.atk = atk_f
	_save.Frog.spd = spd_f
	_save.Frog.pickup_radius = pr_f
	_save.Frog.spacial_skill = ss_f

	_save.write_savegame()

func setGlobalStausDoge():
	Global.player_status = {"Max_HP": hp_d,
	"HP": hp_d,
	"ATK": atk_d,
	"SPD": spd_d,
	"Pickup_Radius": pr_d,
	"Spacial_Skill": ss_d}
	
func setGlobalStausMonkey():
	Global.player_status = {"Max_HP": hp_m,
	"HP": hp_m,
	"ATK": atk_m,
	"SPD": spd_m,
	"Pickup_Radius": pr_m,
	"Spacial_Skill": ss_m}
	
func setGlobalStausFrog():
	Global.player_status = {"Max_HP": hp_f,
	"HP": hp_f,
	"ATK": atk_f,
	"SPD": spd_f,
	"Pickup_Radius": pr_f,
	"Spacial_Skill": ss_f}
	
# called when the Back button is pressed
func _on_BackBtn_pressed():
	# change to main menu scene
	get_tree().change_scene("res://Menus/MainMenu.tscn")

# called when the Play button is pressed
func _on_PlayBtn_pressed():
	# change to world map scene
	get_tree().change_scene("res://Maps/World.tscn")

# called when the TextureRect is pressed
func _on_TextureRect_pressed():
	# set label text to "Dog"
	#label.text = "Dog"
	doge_btn.self_modulate = Color(1,1,1,1)
	monkey_btn.self_modulate = Color(0,0,0,1)
	frog_btn.self_modulate = Color(0,0,0,1)
	setStatusLabel(hp_d,atk_d,spd_d,pr_d, ss_d)	
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Dog"
	Global.player_select = "Doge"
	setGlobalStausDoge()

# called when the TextureRect2 is pressed
func _on_TextureRect2_pressed():
	# set label text to "Monkey"
	#label.text = "Monkey"
	doge_btn.self_modulate = Color(0,0,0,1)
	monkey_btn.self_modulate = Color(1,1,1,1)
	frog_btn.self_modulate = Color(0,0,0,1)
	setStatusLabel(hp_m,atk_m,spd_m,pr_m, ss_m)
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Monkey"
	Global.player_select = "Monkey"
	setGlobalStausMonkey()

# called when the TextureRect3 is pressed
func _on_TextureRect3_pressed():
	# set label text to "Frog"
	#label.text = "Frog"
	doge_btn.self_modulate = Color(0,0,0,1)
	monkey_btn.self_modulate = Color(0,0,0,1)
	frog_btn.self_modulate = Color(1,1,1,1)
	setStatusLabel(hp_f,atk_f,spd_f,pr_f, ss_f)
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Frog"
	Global.player_select = "Frog"
	setGlobalStausFrog()

func setStatusLabel(hp, atk, spd, pr, ss):
	hpL.text = str(hp)	
	atkL.text = str(atk)
	spdL.text = str(spd)
	prL.text = str(pr)
	ssL.text = str(ss)


	
func _on_plus_hp_pressed():
	match Global.player_select:
		"Doge":
			hp_d = clamp(hp_d + 10,10,100)
			hpL.text = str(hp_d)
			setGlobalStausDoge()
		"Monkey":
			hp_m = clamp(hp_m + 10,10,100)
			hpL.text = str(hp_m)
			
			setGlobalStausMonkey()
		"Frog":
			hp_f = clamp(hp_f + 10,10,100)
			hpL.text = str(hp_f)
			
			setGlobalStausFrog()
	_save_game()


func _on_minus_hp_pressed():
	match Global.player_select:
		"Doge":
			hp_d = clamp(hp_d - 10,10,100)
			hpL.text = str(hp_d)
			setGlobalStausDoge()
		"Monkey":
			hp_m = clamp(hp_m - 10,10,100)
			hpL.text = str(hp_m)
			setGlobalStausMonkey()
		"Frog":
			hp_f = clamp(hp_f - 10,10,100)
			hpL.text = str(hp_f)
			setGlobalStausFrog()
	_save_game()

func _on_plus_atk_pressed():
	match Global.player_select:
		"Doge":
			atk_d = clamp(atk_d + 10, 10, 100)
			atkL.text = str(atk_d)
			setGlobalStausDoge()
		"Monkey":
			atk_m = clamp(atk_m + 10, 10, 100)
			atkL.text = str(atk_m)
			setGlobalStausMonkey()
		"Frog":
			atk_f = clamp(atk_f + 10, 10, 100)
			atkL.text = str(atk_f)
			setGlobalStausFrog()
	_save_game()

func _on_minus_atk_pressed():
	match Global.player_select:
		"Doge":
			atk_d = clamp(atk_d - 10, 10, 100)
			atkL.text = str(atk_d)
			setGlobalStausDoge()
		"Monkey":
			atk_m = clamp(atk_m - 10, 10, 100)
			atkL.text = str(atk_m)
			setGlobalStausMonkey()
		"Frog":
			atk_f = clamp(atk_f - 10, 10, 100)
			atkL.text = str(atk_f)
			setGlobalStausFrog()
	_save_game()

func _on_plus_spd_pressed():
	match Global.player_select:
		"Doge":
			spd_d = clamp(spd_d + 10, 10, 100)
			spdL.text = str(spd_d)
			setGlobalStausDoge()
		"Monkey":
			spd_m = clamp(spd_m + 10, 10, 100)
			spdL.text = str(spd_m)
			setGlobalStausMonkey()
		"Frog":
			spd_f = clamp(spd_f + 10, 10, 100)
			spdL.text = str(spd_f)
			setGlobalStausFrog()
	_save_game()

func _on_minus_spd_pressed():
	match Global.player_select:
		"Doge":
			spd_d = clamp(spd_d - 10, 10, 100)
			spdL.text = str(spd_d)
			setGlobalStausDoge()
		"Monkey":
			spd_m = clamp(spd_m - 10, 10, 100)
			spdL.text = str(spd_m)
			setGlobalStausMonkey()
		"Frog":
			spd_f = clamp(spd_f - 10, 10, 100)
			spdL.text = str(spd_f)
			setGlobalStausFrog()
	_save_game()

func _on_plus_pickupR_pressed():
	match Global.player_select:
		"Doge":
			pr_d = clamp(pr_d + 10, 10, 100)
			prL.text = str(pr_d)
			setGlobalStausDoge()
		"Monkey":
			pr_m = clamp(pr_m + 10, 10, 100)
			prL.text = str(pr_m)
			setGlobalStausMonkey()
		"Frog":
			pr_f = clamp(pr_f + 10, 10, 100)
			prL.text = str(pr_f)
			setGlobalStausFrog()
	_save_game()

func _on_minus_pickupR_pressed():
	match Global.player_select:
		"Doge":
			pr_d = clamp(pr_d - 10, 10, 100)
			prL.text = str(pr_d)
			setGlobalStausDoge()
		"Monkey":
			pr_m = clamp(pr_m - 10, 10, 100)
			prL.text = str(pr_m)
			setGlobalStausMonkey()
		"Frog":
			pr_f = clamp(pr_f - 10, 10, 100)
			prL.text = str(pr_f)
			setGlobalStausFrog()
	_save_game()


func _on_switch_skill_toggled(button_pressed):
	if button_pressed:
		match Global.player_select:
			"Doge":
				ss_d = true
				ssL.text = str(ss_d)
				setGlobalStausDoge()
			"Monkey":
				ss_m = true
				ssL.text = str(ss_m)
				setGlobalStausMonkey()
			"Frog":
				ss_f = true
				ssL.text = str(ss_f)
				setGlobalStausFrog()
	if button_pressed != true:
		match Global.player_select:
			"Doge":
				ss_d = false
				ssL.text = str(ss_d)
				setGlobalStausDoge()
			"Monkey":
				ss_m = false
				ssL.text = str(ss_m)
				setGlobalStausMonkey()
			"Frog":
				ss_f = false
				ssL.text = str(ss_f)
				setGlobalStausFrog()	
	_save_game()
