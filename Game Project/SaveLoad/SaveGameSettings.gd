# SaveGameSettings.gd
extends Reference

class_name SaveGameSettings

const SAVE_GAME_PATH := "user://save_settings.json"

var version := 1
var settings_data = SettingsData.new() # เปลี่ยน settings เป็น settings_data

var _file := File.new()

func save_exists() -> bool:
	return _file.file_exists(SAVE_GAME_PATH)


func write_savegame_init():
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return
	
	var data = {
		"Mute": {
			"Volume": 0,
			"Music": 0,
			"Sound": 0,
		},
		"Screen": {
			"FullScreen": false,
		}
	}
		
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()


func write_savegame():
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var data = {
		"Mute": {
			"Volume": settings_data.volume_value,
			"Music": settings_data.music_value, 
			"Sound": settings_data.sound_value, # เปลี่ยน settings.Sound_value เป็น settings_data.sound_value
		},
		"Screen": {
			"FullScreen": settings_data.fullscreen_value, # เปลี่ยน settings.fullscreen_value เป็น settings_data.fullscreen_value
		}
	}
	
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()


func load_savegame():
	var error := _file.open(SAVE_GAME_PATH, File.READ)
	if error != OK:
		printerr("Could not open the file %s. Aborting load operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var content := _file.get_as_text()
	_file.close()

	var data: Dictionary = JSON.parse(content).result
	
	settings_data.volume_value = data["Mute"]["Volume"] # เปลี่ยน settings.volume_value เป็น settings_data.volume_value
	settings_data.music_value = data["Mute"]["Music"] # เปลี่ยน settings.music_value เป็น settings_data.music_value
	settings_data.sound_value = data["Mute"]["Sound"] # เปลี่ยน settings.Sound_value เป็น settings_data.sound_value
	settings_data.fullscreen_value = data["Screen"]["FullScreen"] # เปลี่ยน settings.fullscreen_value เป็น settings_data.fullscreen_value
