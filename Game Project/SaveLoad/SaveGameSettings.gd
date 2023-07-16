
extends Reference

class_name SaveGameSettings

const SAVE_GAME_PATH := "user://save_settings.json"

var version := 1

var settings = Settings.new()

var _file := File.new()

func save_exists() -> bool:
	return _file.file_exists(SAVE_GAME_PATH)


func write_savegame_init():
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return
	
	var data := {
		"Mute": {
		"Music": 0,
		"Sound":0
	  },
	  "Screen": 
		{
		  "FullScreen":false
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

	var data := {
		"Mute": {
		"Music": 0,
		"Sound":0
	  },
	  "Screen": 
		{
		  "FullScreen":false
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
	

#	Dog = TheDoge.new()
#	Monkey = MonkeyCaesar.new()
#	Frog = PepeTheFrog.new()

	Dog.max_hp = data.Players.The_Doge.Max_HP
	Dog.hp = data.Players.The_Doge.HP
	Dog.atk = data.Players.The_Doge.ATK
	Dog.spd = data.Players.The_Doge.SPD
	Dog.pickup_radius = data.Players.The_Doge.Pickup_Radius
	Dog.spacial_skill = data.Players.The_Doge.Spacial_Skill

	Monkey.max_hp = data.Players.Monkey_Caesar.Max_HP
	Monkey.hp = data.Players.Monkey_Caesar.HP
	Monkey.atk = data.Players.Monkey_Caesar.ATK
	Monkey.spd = data.Players.Monkey_Caesar.SPD
	Monkey.pickup_radius = data.Players.Monkey_Caesar.Pickup_Radius
	Monkey.spacial_skill = data.Players.Monkey_Caesar.Spacial_Skill

	Frog.max_hp = data.Players.Pepe_The_Frog.Max_HP
	Frog.hp = data.Players.Pepe_The_Frog.HP
	Frog.atk = data.Players.Pepe_The_Frog.ATK
	Frog.spd = data.Players.Pepe_The_Frog.SPD
	Frog.pickup_radius = data.Players.Pepe_The_Frog.Pickup_Radius
	Frog.spacial_skill = data.Players.Pepe_The_Frog.Spacial_Skill
#
