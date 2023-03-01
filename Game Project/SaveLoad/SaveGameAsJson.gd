
extends Reference

class_name SaveGameAsJSON

const SAVE_GAME_PATH := "user://save.json"

var version := 1

var dog
var monkey
var frog

var _file := File.new()


func save_exists() -> bool:
	return _file.file_exists(SAVE_GAME_PATH)


func write_savegame() -> void:
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var data := {
	"Coin": {
	  "Num_Coin": 0
	},
	"Players": [
	  {
		"ID_Character": "001",
		"Name": "Doge",
		"Max_HP": 50,
		"HP": 50,
		"ATK": 15,
		"SPD": 50,
		"Pickup_Radius": 20,
		"Spacial_Skill": false
	  },
	  {
		"ID_Character": "002",
		"Name": "Monkey caesar",
		"Max_HP": 40,
		"HP": 40,
		"ATK": 20,
		"SPD": 50,
		"Pickup_Radius": 20,
		"Spacial_Skill": false
	  },
	  {
		"ID_Character": "003",
		"Name": "Pepe the frog",
		"Max_HP": 50,
		"HP": 50,
		"ATK": 10,
		"SPD": 60,
		"Pickup_Radius": 20,
		"Spacial_Skill": false
	  }
	]
  }
	
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()


func load_savegame() -> void:
	var error := _file.open(SAVE_GAME_PATH, File.READ)
	if error != OK:
		printerr("Could not open the file %s. Aborting load operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var content := _file.get_as_text()
	_file.close()

	var data: Dictionary = JSON.parse(content).result
	
	
	



