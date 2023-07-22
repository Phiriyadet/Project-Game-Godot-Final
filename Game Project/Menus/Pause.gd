extends Control


### Automatic References Start ###
onready var _settings: Settings = $Settings
### Automatic References Stop ###


onready var _all_collected = $AllCollected
onready var collectedBox = $AllCollected/ScrollContainer/CollectedBox
onready var collectedAllItems = preload("res://Characters/Players/GUI/CollectedWIS.tscn")


func _ready():
	hide()
	if _all_collected != null:
		_all_collected.hide()
	_settings.hide()
	


func close():
	get_tree().paused = false
	hide()

func open():
	show()
	ShowCollected()


func _on_ResumeBtn_pressed():
	close()
	HideCollected()


func _on_ExitBtn_pressed():
	get_tree().quit()


func _on_BackToMainMenu_pressed():
	close()
#	get_tree().change_scene("res://Menus/MainMenu.tscn")
	Global.player_dead = true

func ShowCollected():
	_all_collected.show()
	var collected_list = Global.collected_allitem
	for i in collected_list:
		var collected_item = collectedAllItems.instance()
		collected_item.item = i
		collectedBox.add_child(collected_item)

func HideCollected():
	_all_collected.hide()
	var collected_children = collectedBox.get_children()
	for i in collected_children:
		i.queue_free()


func _on_SettingsBtn_pressed():
	_settings.show()
