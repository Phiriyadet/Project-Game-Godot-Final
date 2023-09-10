extends Control


### Automatic References Start ###
onready var _confirmation_dialog: ConfirmationDialog = $ConfirmationDialog
onready var _settings: Settings = $Settings
### Automatic References Stop ###


onready var start_btn := $VBoxContainer/StartBtn

func _init():
	randomize()
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.show_hide_menu = 0
	start_btn.grab_focus()
	Global.player_dead = false
	Global.level_player = 1
	BackgroundMusic.change_music_init()
	_settings.hide()
	
	
func _physics_process(delta):
	if Global.show_hide_menu == 1:
		hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartBtn_pressed():
	get_tree().change_scene("res://Menus/SelectPlayerMenu.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()


func _on_CreditsBtn_pressed():
	get_tree().change_scene("res://Menus/Credits.tscn")


func _on_SettingBtn_pressed():
	_settings.show()


func _on_ConfirmationDialog_confirmed():
	var dir = Directory.new()
	dir.remove("user://save.json")
	dir.remove("user://coin.json")
	dir.remove("user://save_settings.json")
	print_debug("delete save successfully!")
	_confirmation_dialog.hide()

func _on_DeleteSaveBtn_pressed():
	_confirmation_dialog.show()
