extends Control

### Automatic References Start ###
onready var _all_status: Panel = $AllStatus
onready var _atk_label: Label = $AllStatus/HBoxContainer/StatusContainer2/AtkLabel
onready var _hp_label: Label = $AllStatus/HBoxContainer/StatusContainer2/HpLabel
onready var _pr_label: Label = $AllStatus/HBoxContainer/StatusContainer2/PrLabel
onready var _settings: Settings = $Settings
onready var _spd_label: Label = $AllStatus/HBoxContainer/StatusContainer2/SpdLabel
### Automatic References Stop ###

onready var _all_collected = $AllCollected
onready var collectedBox = $AllCollected/ScrollContainer/CollectedBox
onready var collectedAllItems = preload("res://Characters/Players/GUI/CollectedWIS.tscn")

func _ready():
	hide()
	_all_collected.hide()
	_all_status.hide()
	_settings.hide()

func close():
	get_tree().paused = false
	hide()

func open():
	ShowCollected()
	ShowStatus()
	show()

func _on_ResumeBtn_pressed():
	HideCollected()
	close()

func _on_ExitBtn_pressed():
	get_tree().quit()

func _on_BackToMainMenu_pressed():
	close()
	Global.player_dead = true

func ShowCollected():
	_all_collected.show()
	clearCollectedBox()
	var collected_list = Global.collected_allitem
	var collected_list_sort = collected_list.sort()
	for i in collected_list:
		var collected_item = collectedAllItems.instance()
		collected_item.item = i
		collectedBox.add_child(collected_item)

func HideCollected():
	_all_collected.hide()
	clearCollectedBox()

func clearCollectedBox():
	for child in collectedBox.get_children():
		child.queue_free()

func ShowStatus():
	_hp_label.text = str(Global.player_present_status.HP)
	_atk_label.text = str(Global.player_present_status.ATK)
	_spd_label.text = str(Global.player_present_status.SPD)
	_pr_label.text = str(Global.player_present_status.PR)
	_all_status.show()
	
func _on_SettingsBtn_pressed():
	_settings.show()
