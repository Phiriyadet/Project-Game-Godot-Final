extends Control

### Automatic References Start ###
onready var _buy_ss_btn: Button = $ColorRect/BuySSBtn
onready var _count_down_timer: Timer = $Popup/CountDownTimer
onready var _label_dog: Label = $ColorRect/PlayersContainer/VBoxContainer/Label
onready var _label_frog: Label = $ColorRect/PlayersContainer/VBoxContainer3/Label
onready var _label_monkey: Label = $ColorRect/PlayersContainer/VBoxContainer2/Label
onready var _popup: Popup = $Popup
onready var _price_atk: Label = $ColorRect/Panel/PriceContainer/price_atk
onready var _price_hp: Label = $ColorRect/Panel/PriceContainer/price_hp
onready var _price_pr: Label = $ColorRect/Panel/PriceContainer/price_pr
onready var _price_spd: Label = $ColorRect/Panel/PriceContainer/price_spd
onready var _price_ss: Label = $ColorRect/Panel/PriceContainer/price_ss
onready var _switch_skill: CheckButton = $ColorRect/Panel/ButtonpContainer/HBoxContainer5/switch_skill
### Automatic References Stop ###

var _save := SaveGameAsJson.new()

#onready var label: Label = get_node("ColorRect/Panel/HBoxContainer/VBoxContainer/Label")
onready var coinL:Label = $ColorRect/CoinContainer/coinL
onready var hpL = $ColorRect/Panel/StatusContainer/hpL
onready var atkL = $ColorRect/Panel/StatusContainer/atkL
onready var spdL = $ColorRect/Panel/StatusContainer/spdL
onready var prL = $ColorRect/Panel/StatusContainer/prL
onready var ssL = $ColorRect/Panel/StatusContainer/ssL
onready var playBtn:Button = get_node("PlayBtn") 
onready var players_cont = $ColorRect/PlayersContainer
onready var doge_btn = $ColorRect/PlayersContainer/VBoxContainer/DogTextureRect
onready var monkey_btn = $ColorRect/PlayersContainer/VBoxContainer2/MonkeyTextureRect
onready var frog_btn = $ColorRect/PlayersContainer/VBoxContainer3/FrogTextureRect


var min_hp_d = 50
var min_atk_d = 15
var min_spd_d = 50
var min_pr_d = 20
var max_hp_d = 500
var max_atk_d = 200
var max_spd_d = 200
var max_pr_d = 100

var min_hp_m = 40
var min_atk_m = 20
var min_spd_m = 50
var min_pr_m = 20
var max_hp_m = 400
var max_atk_m = 300
var max_spd_m = 200
var max_pr_m = 100

var min_hp_f = 50
var min_atk_f = 10
var min_spd_f = 60
var min_pr_f = 20
var max_hp_f = 300
var max_atk_f = 200
var max_spd_f = 300
var max_pr_f = 100

var hp_d = 0
var atk_d = 0
var spd_d = 0
var pr_d = 0
var ss_d = false
var b_ss_d = false
var cc_d = 0

var hp_m = 0
var atk_m = 0
var spd_m = 0
var pr_m = 0
var ss_m = false
var b_ss_m = false
var cc_m = 0

var hp_f = 0
var atk_f = 0
var spd_f = 0
var pr_f = 0
var ss_f = false
var b_ss_f = false
var cc_f = 0


func _ready():
	doge_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	monkey_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	frog_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	playBtn.disabled = true
	Global.enemy_dead_count = 0
	_create_or_load_save()

func _create_or_load_save():
	if _save.save_exists() and _save.money_exists():
		_save.load_savegame()
		_save.load_savecoin()
		print_debug("load save")
	else:
		
		_save.write_savegame_init()
		_save.write_savecoin_init()
		print_debug("write_savegame_init")
		_save.load_savegame()
		_save.load_savecoin()

	coinL.text = str(_save.num_coin)
	hp_d = _save.Dog.hp
	atk_d = _save.Dog.atk
	spd_d = _save.Dog.spd
	pr_d = _save.Dog.pickup_radius
	ss_d = _save.Dog.spacial_skill
	b_ss_d = _save.Dog.buy_spacial_skill
	cc_d = _save.Dog.collected_coin

	hp_m = _save.Monkey.hp
	atk_m = _save.Monkey.atk
	spd_m = _save.Monkey.spd
	pr_m = _save.Monkey.pickup_radius
	ss_m = _save.Monkey.spacial_skill
	b_ss_m = _save.Monkey.buy_spacial_skill
	cc_m = _save.Monkey.collected_coin

	hp_f = _save.Frog.hp
	atk_f = _save.Frog.atk
	spd_f = _save.Frog.spd
	pr_f = _save.Frog.pickup_radius
	ss_f = _save.Frog.spacial_skill
	b_ss_f = _save.Frog.buy_spacial_skill
	cc_f = _save.Frog.collected_coin

func _save_game():
	_save.num_coin = int(coinL.text)

	_save.Dog.hp = hp_d
	_save.Dog.atk = atk_d
	_save.Dog.spd = spd_d
	_save.Dog.pickup_radius = pr_d
	_save.Dog.spacial_skill = ss_d
	_save.Dog.buy_spacial_skill = b_ss_d
	_save.Dog.collected_coin = cc_d

	_save.Monkey.hp = hp_m
	_save.Monkey.atk = atk_m
	_save.Monkey.spd = spd_m
	_save.Monkey.pickup_radius = pr_m
	_save.Monkey.spacial_skill = ss_m
	_save.Monkey.buy_spacial_skill = b_ss_m
	_save.Monkey.collected_coin = cc_m

	_save.Frog.hp = hp_f
	_save.Frog.atk = atk_f
	_save.Frog.spd = spd_f
	_save.Frog.pickup_radius = pr_f
	_save.Frog.spacial_skill = ss_f
	_save.Frog.buy_spacial_skill = b_ss_f
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
		"Buy_Spacial_Skill": b_ss_d,
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
		"Buy_Spacial_Skill": b_ss_m,
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
		"Buy_Spacial_Skill": b_ss_f,
		"Collected_Coin": cc_f,
	}

func _on_BackBtn_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")

func _on_PlayBtn_pressed():
	get_tree().change_scene("res://Menus/Mode&DifficultyLevel.tscn")

func _on_TextureRect_pressed():
	doge_btn.self_modulate = Color(1, 1, 1, 1)
	monkey_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	frog_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	if b_ss_d:
		_buy_ss_btn.disabled = true
		_switch_skill.disabled = false
	else:
		_buy_ss_btn.disabled = false
		_switch_skill.disabled = true
	setStatusLabel(hp_d, atk_d, spd_d, pr_d, ss_d)
	playBtn.disabled = false
	Global.player_select = "Doge"
	setGlobalStausDoge()
	_update_switch_skill()

func _on_TextureRect2_pressed():
	doge_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	monkey_btn.self_modulate = Color(1, 1, 1, 1)
	frog_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	if b_ss_m:
		_buy_ss_btn.disabled = true
		_switch_skill.disabled = false
	else:
		_buy_ss_btn.disabled = false
		_switch_skill.disabled = true
	setStatusLabel(hp_m, atk_m, spd_m, pr_m, ss_m)
	playBtn.disabled = false
	Global.player_select = "Monkey"

	setGlobalStausMonkey()
	_update_switch_skill()

func _on_TextureRect3_pressed():
	doge_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	monkey_btn.self_modulate = Color(0.5, 0.5, 0.5, 1)
	frog_btn.self_modulate = Color(1, 1, 1, 1)
	if b_ss_m:
		_buy_ss_btn.disabled = true
		_switch_skill.disabled = false
	else:
		_buy_ss_btn.disabled = false
		_switch_skill.disabled = true
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
	
		match Global.player_select:
			"Doge":
				if int(coinL.text) >= int(_price_hp.text):
					coinL.text = str(int(coinL.text) - int(_price_hp.text))
					cc_d += int(_price_hp.text)
					hp_d = clamp(hp_d + 10, min_hp_d, max_hp_d)
					hpL.text = str(hp_d)
					setGlobalStausDoge()
				else:
					_popup.show()
					_count_down_timer.start()
			"Monkey":
				if int(coinL.text) >= int(_price_hp.text):
					coinL.text = str(int(coinL.text) - int(_price_hp.text))
					cc_m += int(_price_hp.text)
					hp_m = clamp(hp_m + 10, min_hp_m, max_hp_m)
					hpL.text = str(hp_m)
					setGlobalStausMonkey()
				else:
					_popup.show()
					_count_down_timer.start()
			"Frog":
				if int(coinL.text) >= int(_price_hp.text):
					coinL.text = str(int(coinL.text) - int(_price_hp.text))
					cc_f += int(_price_hp.text)
					hp_f = clamp(hp_f + 10, min_hp_f, max_hp_f)
					hpL.text = str(hp_f)
					setGlobalStausFrog()
				else:
					_popup.show()
					_count_down_timer.start()
		_save_game()
	

func _on_minus_hp_pressed():
	
	match Global.player_select:
		"Doge":
			if int(cc_d) >= int(_price_hp.text):
				coinL.text = str(int(coinL.text) + int(_price_hp.text))
				cc_d -= int(_price_hp.text)
				hp_d = clamp(hp_d - 10, min_hp_d, max_hp_d)
				hpL.text = str(hp_d)
				setGlobalStausDoge()
			else:
				_popup.show()
				_count_down_timer.start()
		"Monkey":
			if int(cc_m) >= int(_price_hp.text):
				coinL.text = str(int(coinL.text) + int(_price_hp.text))
				cc_m -= int(_price_hp.text)
				hp_m = clamp(hp_m - 10, min_hp_m, max_hp_m)
				hpL.text = str(hp_m)
				setGlobalStausMonkey()
			else:
				_popup.show()
				_count_down_timer.start()
		"Frog":
			if int(cc_f) >= int(_price_hp.text):
				coinL.text = str(int(coinL.text) + int(_price_hp.text))
				cc_f -= int(_price_hp.text)
				hp_f = clamp(hp_f - 10, min_hp_f, max_hp_f)
				hpL.text = str(hp_f)
				setGlobalStausFrog()
			else:
				_popup.show()
				_count_down_timer.start()
	_save_game()

func _on_plus_atk_pressed():
	
		match Global.player_select:
			"Doge":
				if int(coinL.text) >= int(_price_hp.text):
					coinL.text = str(int(coinL.text) - int(_price_atk.text))
					cc_d += int(_price_atk.text)
					atk_d = clamp(atk_d + 10, min_atk_d, max_atk_d)
					atkL.text = str(atk_d)
					setGlobalStausDoge()
				else:
					_popup.show()
					_count_down_timer.start()
			"Monkey":
				if int(coinL.text) >= int(_price_hp.text):
					coinL.text = str(int(coinL.text) - int(_price_atk.text))
					cc_m += int(_price_atk.text)
					atk_m = clamp(atk_m + 10, min_atk_m, max_atk_m)
					atkL.text = str(atk_m)
					setGlobalStausMonkey()
				else:
					_popup.show()
					_count_down_timer.start()
			"Frog":
				if int(coinL.text) >= int(_price_hp.text):
					coinL.text = str(int(coinL.text) - int(_price_atk.text))
					cc_f += int(_price_atk.text)
					atk_f = clamp(atk_f + 10, min_atk_f, max_atk_f)
					atkL.text = str(atk_f)
					setGlobalStausFrog()
				else:
					_popup.show()
					_count_down_timer.start()
		_save_game()

func _on_minus_atk_pressed():
	match Global.player_select:
		"Doge":
			if int(cc_d) >= int(_price_spd.text):
				coinL.text = str(int(coinL.text) + int(_price_spd.text))
				cc_d -= int(_price_hp.text)
				atk_d = clamp(atk_d - 10, min_atk_d, max_atk_d)
				atkL.text = str(atk_d)
				setGlobalStausDoge()
			else:
				_popup.show()
				_count_down_timer.start()
		"Monkey":
			if int(cc_m) >= int(_price_spd.text):
				coinL.text = str(int(coinL.text) + int(_price_spd.text))
				cc_m -= int(_price_hp.text)
				atk_m = clamp(atk_m - 10, min_atk_m, max_atk_m)
				atkL.text = str(atk_m)
				setGlobalStausMonkey()
			else:
				_popup.show()
				_count_down_timer.start()
		"Frog":
			if int(cc_f) >= int(_price_spd.text):
				coinL.text = str(int(coinL.text) + int(_price_spd.text))
				cc_f -= int(_price_hp.text)
				atk_f = clamp(atk_f - 10, min_atk_f, max_atk_f)
				atkL.text = str(atk_f)
				setGlobalStausFrog()
			else:
				_popup.show()
				_count_down_timer.start()
	_save_game()

func _on_plus_spd_pressed():
	
		match Global.player_select:
			"Doge":
				if int(coinL.text) >= int(_price_spd.text):
					coinL.text = str(int(coinL.text) - int(_price_spd.text))
					cc_d += int(_price_spd.text)
					spd_d = clamp(spd_d + 10, min_spd_d, max_spd_d)
					spdL.text = str(spd_d)
					setGlobalStausDoge()
				else:
					_popup.show()
					_count_down_timer.start()
			"Monkey":
				if int(coinL.text) >= int(_price_spd.text):
					coinL.text = str(int(coinL.text) - int(_price_spd.text))
					cc_m += int(_price_spd.text)
					spd_m = clamp(spd_m + 10, min_spd_m, max_spd_m)
					spdL.text = str(spd_m)
					setGlobalStausMonkey()
				else:
					_popup.show()
					_count_down_timer.start()
			"Frog":
				if int(coinL.text) >= int(_price_spd.text):
					coinL.text = str(int(coinL.text) - int(_price_spd.text))
					cc_f += int(_price_spd.text)
					spd_f = clamp(spd_f + 10, min_spd_f, max_spd_f)
					spdL.text = str(spd_f)
					setGlobalStausFrog()
				else:
					_popup.show()
					_count_down_timer.start()
		_save_game()

func _on_minus_spd_pressed():
	match Global.player_select:
		"Doge":
			if int(cc_d) >= int(_price_spd.text):
				coinL.text = str(int(coinL.text) + int(_price_spd.text))
				cc_d -= int(_price_spd.text)
				spd_d = clamp(spd_d - 10, min_spd_d, max_spd_d)
				spdL.text = str(spd_d)
				setGlobalStausDoge()
			else:
				_popup.show()
				_count_down_timer.start()
		"Monkey":
			if int(cc_m) >= int(_price_spd.text):
				coinL.text = str(int(coinL.text) + int(_price_spd.text))
				cc_m -= int(_price_spd.text)
				spd_m = clamp(spd_m - 10, min_spd_m, max_spd_m)
				spdL.text = str(spd_m)
				setGlobalStausMonkey()
			else:
				_popup.show()
				_count_down_timer.start()
		"Frog":
			if int(cc_f) >= int(_price_spd.text):
				coinL.text = str(int(coinL.text) + int(_price_spd.text))
				cc_f -= int(_price_spd.text)
				spd_f = clamp(spd_f - 10, min_spd_f, max_spd_f)
				spdL.text = str(spd_f)
				setGlobalStausFrog()
			else:
				_popup.show()
				_count_down_timer.start()
	_save_game()

func _on_plus_pickupR_pressed():
	
		match Global.player_select:
			"Doge":
				if int(coinL.text) >= int(_price_pr.text):
					coinL.text = str(int(coinL.text) - int(_price_pr.text))
					cc_d += int(_price_pr.text)
					pr_d = clamp(pr_d + 10, min_pr_d, max_pr_d)
					prL.text = str(pr_d)
					setGlobalStausDoge()
				else:
					_popup.show()
					_count_down_timer.start()
			"Monkey":
				if int(coinL.text) >= int(_price_pr.text):
					coinL.text = str(int(coinL.text) - int(_price_pr.text))
					cc_m += int(_price_pr.text)
					pr_m = clamp(pr_m + 10, min_hp_m, max_pr_m)
					prL.text = str(pr_m)
					setGlobalStausMonkey()
				else:
					_popup.show()
					_count_down_timer.start()
			"Frog":
				if int(coinL.text) >= int(_price_pr.text):
					coinL.text = str(int(coinL.text) - int(_price_pr.text))
					cc_f += int(_price_pr.text)
					pr_f = clamp(pr_f + 10, min_pr_f, max_pr_f)
					prL.text = str(pr_f)
					setGlobalStausFrog()
				else:
					_popup.show()
					_count_down_timer.start()
		_save_game()
	
func _on_minus_pickupR_pressed():
	match Global.player_select:
		"Doge":
			if int(cc_d) >= int(_price_pr.text):
				coinL.text = str(int(coinL.text) + int(_price_pr.text))
				cc_d -= int(_price_pr.text)
				pr_d = clamp(pr_d - 10, min_pr_d, max_pr_d)
				prL.text = str(pr_d)
				setGlobalStausDoge()
			else:
				_popup.show()
				_count_down_timer.start()
		"Monkey":
			if int(cc_m) >= int(_price_pr.text):
				coinL.text = str(int(coinL.text) + int(_price_pr.text))
				cc_m -= int(_price_pr.text)
				pr_m = clamp(pr_m - 10, min_hp_m, max_pr_m)
				prL.text = str(pr_m)
				setGlobalStausMonkey()
			else:
				_popup.show()
				_count_down_timer.start()
		"Frog":
			if int(cc_f) >= int(_price_pr.text):
				coinL.text = str(int(coinL.text) + int(_price_pr.text))
				cc_f -= int(_price_pr.text)
				pr_f = clamp(pr_f - 10, min_pr_f, max_pr_f)
				prL.text = str(pr_f)
				setGlobalStausFrog()
			else:
				_popup.show()
				_count_down_timer.start()
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
	
func _on_BuySSBtn_pressed():
	
		match Global.player_select:
				"Doge":
					if int(coinL.text) >= int(_price_ss.text):
						if not b_ss_d:
							coinL.text = str(int(coinL.text) - int(_price_ss.text))
							cc_d += int(_price_ss.text)
							_switch_skill.disabled = false
							b_ss_d = true
							ss_d = true
							setGlobalStausDoge()
						else:
							_buy_ss_btn.disabled = true 
					else:
						_popup.show()
						_count_down_timer.start()
				"Monkey":
					if int(coinL.text) >= int(_price_ss.text):
						if not b_ss_m:
							coinL.text = str(int(coinL.text) - int(_price_ss.text))
							cc_m += int(_price_ss.text)
							_switch_skill.disabled = false
							b_ss_m = true
							ss_m = true
							setGlobalStausMonkey()
						else:
							_buy_ss_btn.disabled = true
					else:
						_popup.show()
						_count_down_timer.start()
				"Frog":
					if int(coinL.text) >= int(_price_ss.text):
						if not b_ss_f:
							coinL.text = str(int(coinL.text) - int(_price_ss.text))
							cc_f += int(_price_ss.text)
							_switch_skill.disabled = false
							b_ss_f = true
							ss_f = true
							setGlobalStausFrog()
						else:
							_buy_ss_btn.disabled = true
					else:
						_popup.show()
						_count_down_timer.start()
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
			b_ss_d = false
			_switch_skill.disabled = true
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
			b_ss_m = false
			_switch_skill.disabled = true
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
			b_ss_f = false
			_switch_skill.disabled = true
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
			


func _on_DogTextureRect_focus_entered():
	_label_dog.self_modulate = Color(0.4,0.75,0.03)
	_label_dog.uppercase = true

func _on_DogTextureRect_focus_exited():
	_label_dog.self_modulate = Color(1,1,1)
	_label_dog.uppercase = false

func _on_DogTextureRect_mouse_entered():
	_label_dog.self_modulate = Color(0.4,0.75,0.03)
	_label_dog.uppercase = true

func _on_DogTextureRect_mouse_exited():
	_label_dog.self_modulate = Color(1,1,1)
	_label_dog.uppercase = false

func _on_MonkeyTextureRect_focus_entered():
	_label_monkey.self_modulate = Color(0.4,0.75,0.03)
	_label_monkey.uppercase = true

func _on_MonkeyTextureRect_focus_exited():
	_label_monkey.self_modulate = Color(1,1,1)
	_label_monkey.uppercase = false

func _on_MonkeyTextureRect_mouse_entered():
	_label_monkey.self_modulate = Color(0.4,0.75,0.03)
	_label_monkey.uppercase = true

func _on_MonkeyTextureRect_mouse_exited():
	_label_monkey.self_modulate = Color(1,1,1)
	_label_monkey.uppercase = false

func _on_FrogTextureRect_focus_entered():
	_label_frog.self_modulate = Color(0.4,0.75,0.03)
	_label_frog.uppercase = true

func _on_FrogTextureRect_focus_exited():
	_label_frog.self_modulate = Color(1,1,1)
	_label_frog.uppercase = false

func _on_FrogTextureRect_mouse_entered():
	_label_frog.self_modulate = Color(0.4,0.75,0.03)
	_label_frog.uppercase = true

func _on_FrogTextureRect_mouse_exited():
	_label_frog.self_modulate = Color(1,1,1)
	_label_frog.uppercase = false



