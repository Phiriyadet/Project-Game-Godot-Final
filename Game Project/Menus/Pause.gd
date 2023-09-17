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

onready var player_status:  = get_tree().current_scene.get_node("Player").get_child(0)

func _ready():
	hide()

func close():
	get_tree().paused = false
	hide()

func open():
	player_status  = get_tree().current_scene.get_node("Player").get_child(0)
#	อาวุธ สกิล และไอเทมทั้งหมด
	clearCollectedBox()
	var collected_list = Global.collected_allitem
	var collected_list_sort = collected_list.sort()
	for i in collected_list:
		var collected_item = collectedAllItems.instance()
		collected_item.item = i
		collectedBox.add_child(collected_item)
#		print(UpgradeDb.UPGRADES[i]["level"])
#	สถานะตัวละคร
	_hp_label.text = str(player_status.hp)
	_atk_label.text = str(player_status.atk)
	_spd_label.text = str(player_status.spd)
	_pr_label.text = str(player_status.pickup_radius)
	show()

func _on_ResumeBtn_pressed():
	close()

func _on_ExitBtn_pressed():
	get_tree().quit()

func _on_BackToMainMenu_pressed():
	close()
	Global.player_dead = true
	Global.game_over()

func clearCollectedBox():
	for child in collectedBox.get_children():
		child.queue_free()

func _on_SettingsBtn_pressed():
	_settings.show()
