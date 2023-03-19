extends Control

var _save := SaveGameAsJson.new()
#onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label")
onready var coinL:Label = get_node("ColorRect/VBoxContainer/coinL")
onready var hpL = $ColorRect/Panel/HBoxContainer/VBoxContainer4/hpL
onready var atkL = $ColorRect/Panel/HBoxContainer/VBoxContainer4/atkL
onready var spdL = $ColorRect/Panel/HBoxContainer/VBoxContainer4/spdL
onready var prL = $ColorRect/Panel/HBoxContainer/VBoxContainer4/prL
onready var playBtn:Button = get_node("PlayBtn") 

var hp_d =0
var atk_d=0
var spd_d=0
var pr_d=0
var ss_d=false

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
	# disable play button when the scene is loaded
	playBtn.disabled = true
	# set global variable enemy_dead_count to 0
	Global.enemy_dead_count = 0
	_create_or_load_save()
	
func _create_or_load_save() -> void:
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
	


func _save_game() -> void:
	_save.num_coin = int(coinL.text)
	# _save.Dog.hp =
	#  _save.Dog.atk=
	#  _save.Dog.spd=
	# _save.Dog.pickup_radius=
	# _save.Monkey.hp=
	#  _save.Monkey.atk=
	#  _save.Monkey.spd=
	# _save.Monkey.pickup_radius=
	# _save.Frog.hp=
	#  _save.Frog.atk=
	#  _save.Frog.spd=
	# _save.Frog.pickup_radius =
	_save.write_savegame()

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
	hpL.text = str(hp_d)	
	atkL.text = str(atk_d)
	spdL.text = str(spd_d)
	prL.text = str(pr_d)	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Dog"
	Global.player_select = "Doge"
	Global.player_status = {"Max_HP": hp_d,
	"HP": hp_d,
	"ATK": atk_d,
	"SPD": spd_d,
	"Pickup_Radius": pr_d,
	"Spacial_Skill": ss_d}

# called when the TextureRect2 is pressed
func _on_TextureRect2_pressed():
	# set label text to "Monkey"
	#label.text = "Monkey"
	hpL.text = str(hp_m)	
	atkL.text = str(atk_m)
	spdL.text = str(spd_m)
	prL.text = str(pr_m)
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Monkey"
	Global.player_select = "Monkey"
	Global.player_status = {"Max_HP": hp_m,
	"HP": hp_m,
	"ATK": atk_m,
	"SPD": spd_m,
	"Pickup_Radius": pr_m,
	"Spacial_Skill": ss_m}

# called when the TextureRect3 is pressed
func _on_TextureRect3_pressed():
	# set label text to "Frog"
	#label.text = "Frog"
	hpL.text = str(hp_f)	
	atkL.text = str(atk_f)
	spdL.text = str(spd_f)
	prL.text = str(pr_f)
	# enable play button
	playBtn.disabled = false
	# set global variable player_select to "Frog"
	Global.player_select = "Frog"
	Global.player_status = {"Max_HP": hp_f,
	"HP": hp_f,
	"ATK": atk_f,
	"SPD": spd_f,
	"Pickup_Radius": pr_f,
	"Spacial_Skill": ss_f}
