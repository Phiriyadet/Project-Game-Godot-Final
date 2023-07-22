extends Control


### Automatic References Start ###
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
	start_btn.grab_focus()
	Global.player_dead = false
	Global.level_player = 1
	_settings.hide()
	
	

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
