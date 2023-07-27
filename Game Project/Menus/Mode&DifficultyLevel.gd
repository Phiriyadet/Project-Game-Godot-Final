extends Control


### Automatic References Start ###
onready var _alert: Label = $ColorRect/Alert
onready var _back_btn: Button = $PlayBackContainer/BackBtn
onready var _easy_level_btn: Button = $ColorRect/DifficultyContainer/HBoxContainer/EasyLevelBtn
onready var _endless_mode_btn: Button = $ColorRect/ModeContainer/HBoxContainer/EndlessModeBtn
onready var _hard_level_btn: Button = $ColorRect/DifficultyContainer/HBoxContainer/HardLevelBtn
onready var _normal_mode_btn: Button = $ColorRect/ModeContainer/HBoxContainer/NormalModeBtn
onready var _play_btn: Button = $PlayBackContainer/PlayBtn
onready var _very_hard_level_btn: Button = $ColorRect/DifficultyContainer/HBoxContainer/VeryHardLevelBtn
onready var diff_label: Label = $ColorRect/DifficultyContainer/Label
onready var mode_label: Label = $ColorRect/ModeContainer/Label
### Automatic References Stop ###


var mode_check = false
var diff_check = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NormalModeBtn_pressed():
	_endless_mode_btn.pressed = false
	mode_check = true
	mode_label.text = "โหมดการเล่นจำกัดเวลา 20 นาที บอสจะปรากฎตัวในนาทีที่ 15 กำจัดมันก่อนหมดเวลาจึงจะชนะ" 
	Global.selectMod = 0

func _on_EndlessModeBtn_pressed():
	_normal_mode_btn.pressed = false
	mode_check = true
	mode_label.text = "โหมดการเล่นไม่จำกัดเวลา เล่นได้นานเท่าที่ไหว" 
	Global.selectMod = 1

func _on_EasyLevelBtn_pressed():
	Global.difficulty_level = 1
	_hard_level_btn.pressed = false
	_very_hard_level_btn.pressed = false
	diff_check = true
	diff_label.text = "ระดับง่าย\n Status monster:HP, ATK, SPD เท่าเดิม" 


func _on_HardLevelBtn_pressed():
	Global.difficulty_level = 2
	_easy_level_btn.pressed = false
	_very_hard_level_btn.pressed = false
	diff_check = true
	diff_label.text = "ระดับยาก\n Status monster:HP, ATK, SPD เพิ่มขึ้น 50%" 

func _on_VeryHardLevelBtn_pressed():
	Global.difficulty_level = 3
	_easy_level_btn.pressed = false
	_hard_level_btn.pressed = false
	diff_check = true
	diff_label.text = "ระดับยากมาก\n Status monster:HP, ATK, SPD เพิ่มขึ้น 100%" 


func _on_PlayBtn_pressed():
	if mode_check and diff_check:
		get_tree().change_scene("res://Maps/World.tscn")
	else:
		_alert.visible = true


func _on_BackBtn_pressed():
	get_tree().change_scene("res://Menus/SelectPlayerMenu.tscn")



