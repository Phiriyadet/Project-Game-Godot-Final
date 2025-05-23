extends Control

class_name Settings


### Automatic References Start ###
onready var _fullscreenBtn: CheckButton = $VBoxContainer/FullScreenBtn
onready var _music: HSlider = $VBoxContainer/Music
onready var _sounds: HSlider = $VBoxContainer/Sounds
onready var _volume: HSlider = $VBoxContainer/volume
### Automatic References Stop ###

var _settings_data = SettingsData.new() # เปลี่ยน settings เป็น _settings_data
var save_game_settings = SaveGameSettings.new()

func _ready():
	# Load the saved settings when the settings scene is loaded
	load_saved_settings()
#	_on_volume_value_changed(-40)

func _on_FullScreen_CheckButton_pressed():
	_settings_data.fullscreen_value = _fullscreenBtn.pressed # เปลี่ยน settings.fullscreen_value เป็น _settings_data.fullscreen_value
	OS.set_window_fullscreen(_settings_data.fullscreen_value)
	# Save the settings when the fullscreen is toggled
	save_settings()

func _on_BackBtn_pressed():
	hide()

func _on_Music_value_changed(value):
	_settings_data.music_value = value # เปลี่ยน settings.music_value เป็น _settings_data.music_value
	if _settings_data.music_value == -45:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), _settings_data.music_value)
	# Save the settings when the music volume is changed
	save_settings()

func _on_Sounds_value_changed(value):
	_settings_data.sound_value = value # เปลี่ยน settings.sound_value เป็น _settings_data.sound_value
	if _settings_data.sound_value == -45:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sounds"), _settings_data.sound_value)
	# Save the settings when the sound volume is changed
	save_settings()

func _on_volume_value_changed(value):
	_settings_data.volume_value = value # เปลี่ยน settings.volume_value เป็น _settings_data.volume_value
	if _settings_data.volume_value == -45:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), _settings_data.volume_value)
#	print(value)
	# Save the settings when the volume is changed
	save_settings()

func save_settings():
	# Set the settings data in the SaveGameSettings instance
	save_game_settings.settings_data = _settings_data # เปลี่ยน save_game_settings.settings เป็น save_game_settings.settings_data
	# Write the settings data to the file
	save_game_settings.write_savegame()

func load_saved_settings():
	# Check if the save file exists
	if save_game_settings.save_exists():
		# Load the saved settings from the file
		save_game_settings.load_savegame()
		
	else:
		# If the save file does not exist, create and write the default settings
		save_game_settings.write_savegame_init()
		
	# Set the loaded settings to the current values
	_settings_data.volume_value = save_game_settings.settings_data.volume_value # เปลี่ยน settings.volume_value เป็น _settings_data.volume_value
	_settings_data.music_value = save_game_settings.settings_data.music_value # เปลี่ยน settings.music_value เป็น _settings_data.music_value
	_settings_data.sound_value = save_game_settings.settings_data.sound_value # เปลี่ยน settings.sound_value เป็น _settings_data.sound_value
	_settings_data.fullscreen_value = save_game_settings.settings_data.fullscreen_value # เปลี่ยน settings.fullscreen_value เป็น _settings_data.fullscreen_value
	# Apply the loaded settings to the game
	_music.value = _settings_data.music_value
	_sounds.value = _settings_data.sound_value
	_volume.value = _settings_data.volume_value
	_fullscreenBtn.pressed = _settings_data.fullscreen_value
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), _settings_data.music_value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sounds"), _settings_data.sound_value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), _settings_data.volume_value)
	OS.set_window_fullscreen(_settings_data.fullscreen_value)
