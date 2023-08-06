extends Control

### Automatic References Start ###
onready var _count_down_timer: Timer = $Popup/CountDownTimer
onready var _popup: Popup = $Popup
onready var _price_atk: Label = $ColorRect/Panel/HBoxContainer/PriceContainer/price_atk
onready var _price_hp: Label = $ColorRect/Panel/HBoxContainer/PriceContainer/price_hp
onready var _price_pr: Label = $ColorRect/Panel/HBoxContainer/PriceContainer/price_pr
onready var _price_spd: Label = $ColorRect/Panel/HBoxContainer/PriceContainer/price_spd
onready var _price_ss: Label = $ColorRect/Panel/HBoxContainer/PriceContainer/price_ss
onready var _switch_skill: CheckButton = $ColorRect/Panel/HBoxContainer/ButtonpContainer/switch_skill
### Automatic References Stop ###

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
var cc_d = 0

var hp_m = 0
var atk_m = 0
var spd_m = 0
var pr_m = 0
var ss_m = false
var cc_m = 0

var hp_f = 0
var atk_f = 0
var spd_f = 0
var pr_f = 0
var ss_f = false
var cc_f = 0

func _ready():
	doge_btn.self_modulate = Color(0, 0, 0, 1)
	monkey_btn.self_modulate = Color(0, 0, 0, 1)
	frog_btn.self_modulate = Color(0, 0, 0, 1)
	playBtn.disabled = true
	Global.enemy_dead_count = 0
	_create_or_load_save()

func _create_or_load_save():
	if _save.save_exists() and _save.money_exists():
		_save.load_savegame()
		_save.load_savecoin()
	else:
		_save.write_savegame_init()
		_save.write_savecoin_init()

	coinL.text = str(_save.num_coin)
	hp_d = _save.Dog.hp
	atk_d = _save.Dog.atk
	spd_d = _save.Dog.spd
	pr_d = _save.Dog.pickup_radius
	ss_d = _save.Dog.spacial_skill
	cc_d = _save.Dog.collected_coin

	hp_m = _save.Monkey.hp
	atk_m = _save.Monkey.atk
	spd_m = _save.Monkey.spd
	pr_m = _save.Monkey.pickup_radius
	ss_m = _save.Monkey.spacial_skill
	cc_m = _save.Monkey.collected_coin

	hp_f = _save.Frog.hp
	atk_f = _save.Frog.atk
	spd_f = _save.Frog.spd
	pr_f = _save.Frog.pickup_radius
	ss_f = _save.Frog.spacial_skill
	cc_f = _save.Frog.collected_coin

func _save_game():
	_save.num_coin = int(coinL.text)

	_save.Dog.hp = hp_d
	_save.Dog.atk = atk_d
	_save.Dog.spd = spd_d
	_save.Dog.pickup_radius = pr_d
	_save.Dog.spacial_skill = ss_d
	_save.Dog.collected_coin = cc_d

	_save.Monkey.hp = hp_m
	_save.Monkey.atk = atk_m
	_save.Monkey.spd = spd_m
	_save.Monkey.pickup_radius = pr_m
	_save.Monkey.spacial_skill = ss_m
	_save.Monkey.collected_coin = cc_m

	_save.Frog.hp = hp_f
	_save.Frog.atk = atk_f
	_save.Frog.spd = spd_f
	_save.Frog.pickup_radius = pr_f
	_save.Frog.spacial_skill = ss_f
	_save.Frog.collected_coin = cc_f

	_save.write_savecoin()
	_save.write_savegame()

func setGlobalStausDoge():
	Global.player_status = {
		"Max_HP": hp_d,
		"HP": hp_d,
		"ATK": atk_d,
		"SPD": spd_d,
		"Pickup_Radius": pr_d,
		"Spacial_Skill": ss_d,
		"Collected_Coin": cc_d,
	}

func setGlobalStausMonkey():
	Global.player_status = {
		"Max_HP": hp_m,
		"HP": hp_m,
		"ATK": atk_m,
		"SPD": spd_m,
		"Pickup_Radius": pr_m,
		"Spacial_Skill": ss_m,
		"Collected_Coin": cc_m,
	}

func setGlobalStausFrog():
	Global.player_status = {
		"Max_HP": hp_f,
		"HP": hp_f,
		"ATK": atk_f,
		"SPD": spd_f,
		"Pickup_Radius": pr_f,
		"Spacial_Skill": ss_f,
		"Collected_Coin": cc_f,
	}

func _on_BackBtn_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")

func _on_PlayBtn_pressed():
	get_tree().change_scene("res://Menus/Mode&DifficultyLevel.tscn")

func _on_TextureRect_pressed():
	doge_btn.self_modulate = Color(1, 1, 1, 1)
	monkey_btn.self_modulate = Color(0, 0, 0, 1)
	frog_btn.self_modulate = Color(0, 0, 0, 1)
	setStatusLabel(hp_d, atk_d, spd_d, pr_d, ss_d)
	playBtn.disabled = false
	Global.player_select = "Doge"
	setGlobalStausDoge()
	_update_switch_skill()

func _on_TextureRect2_pressed():
	doge_btn.self_modulate = Color(0, 0, 0, 1)
	monkey_btn.self_modulate = Color(1, 1, 1, 1)
	frog_btn.self_modulate = Color(0, 0, 0, 1)
	setStatusLabel(hp_m, atk_m, spd_m, pr_m, ss_m)
	playBtn.disabled = false
	Global.player_select = "Monkey"
	setGlobalStausMonkey()
	_update_switch_skill()

func _on_TextureRect3_pressed():
	doge_btn.self_modulate = Color(0, 0, 0, 1)
	monkey_btn.self_modulate = Color(0, 0, 0, 1)
	frog_btn.self_modulate = Color(1, 1, 1, 1)
	setStatusLabel(hp_f, atk_f, spd_f, pr_f, ss_f)
	playBtn.disabled = false
	Global.player_select = "Frog"
	setGlobalStausFrog()
	_update_switch_skill()

func setStatusLabel(hp, atk, spd, pr, ss):
	hpL.text = str(hp)
	atkL.text = str(atk)
	spdL.text = str(spd)
	prL.text = str(pr)
	if ss:
		ssL.text = "Active"
	else:
		ssL.text = "Inactive"
	_update_switch_skill()
	
func _on_plus_hp_pressed():
	if int(coinL.text) >= int(_price_hp.text):
		match Global.player_select:
			"Doge":
				coinL.text = str(int(coinL.text) - int(_price_hp.text))
				hp_d = clamp(hp_d + 10, 10, 100)
				hpL.text = str(hp_d)
				setGlobalStausDoge()
			"Monkey":
				coinL.text = str(int(coinL.text) - int(_price_hp.text))
				hp_m = clamp(hp_m + 10, 10, 100)
				hpL.text = str(hp_m)
				setGlobalStausMonkey()
			"Frog":
				coinL.text = str(int(coinL.text) - int(_price_hp.text))
				hp_f = clamp(hp_f + 10, 10, 100)
				hpL.text = str(hp_f)
				setGlobalStausFrog()
		_save_game()
	else:
		_popup.show()
		_count_down_timer.start()

func _on_minus_hp_pressed():
	match Global.player_select:
		"Doge":
			hp_d = clamp(hp_d - 10, 10, 100)
			hpL.text = str(hp_d)
			setGlobalStausDoge()
		"Monkey":
			hp_m = clamp(hp_m - 10, 10, 100)
			hpL.text = str(hp_m)
			setGlobalStausMonkey()
		"Frog":
			hp_f = clamp(hp_f - 10, 10, 100)
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
	match Global.player_select:
		"Doge":
			ss_d = button_pressed
			if ss_d:
				ssL.text = "Active"
			else:
				ssL.text = "Inactive"
			setGlobalStausDoge()
		"Monkey":
			ss_m = button_pressed
			if ss_m:
				ssL.text = "Active"
			else:
				ssL.text = "Inactive"
			setGlobalStausMonkey()
		"Frog":
			ss_f = button_pressed
			if ss_f:
				ssL.text = "Active"
			else:
				ssL.text = "Inactive"
			setGlobalStausFrog()
	_update_switch_skill()
	_save_game()

func _on_CountDownTimer_timeout():
	_popup.hide()

func _on_RefundBtn_pressed():
	match Global.player_select:
		"Doge":
			hp_d = 50
			atk_d = 15
			spd_d = 50
			pr_d = 20
			ss_d = false
			coinL.text = str(int(coinL.text) + cc_d)
			cc_d = 0
			setStatusLabel(hp_d, atk_d, spd_d, pr_d, ss_d)
			setGlobalStausDoge()
		"Monkey":
			hp_m = 40
			atk_m = 20
			spd_m = 50
			pr_m = 20
			ss_m = false
			coinL.text = str(int(coinL.text) + cc_m)
			cc_m = 0
			setStatusLabel(hp_m, atk_m, spd_m, pr_m, ss_m)
			setGlobalStausMonkey()
		"Frog":
			hp_f = 50
			atk_f = 10
			spd_f = 60
			pr_f = 20
			ss_f = false
			coinL.text = str(int(coinL.text) + cc_f)
			cc_f = 0
			setStatusLabel(hp_f, atk_f, spd_f, pr_f, ss_f)
			setGlobalStausFrog()
	_save_game()
	
func _update_switch_skill():
	# ตรวจสอบว่า _current_player_select มีค่าอะไร และตั้งค่าค่า _switch_skill ตามนั้น
	match Global.player_select:
		"Doge":
			_switch_skill.pressed = ss_d
		"Monkey":
			_switch_skill.pressed = ss_m
		"Frog":
			_switch_skill.pressed = ss_f
