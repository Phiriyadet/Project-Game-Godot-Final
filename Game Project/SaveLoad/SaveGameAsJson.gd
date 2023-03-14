
extends Reference

class_name SaveGameAsJson

const SAVE_GAME_PATH := "user://save.json"

var version := 1

var	Dog = TheDog.new()
var	Monkey = MonkeyCaesar.new()
var	Frog = PepeTheFrog.new()
var num_coin = 0

var _file := File.new()


func save_exists() -> bool:
	return _file.file_exists(SAVE_GAME_PATH)


func write_savegame():
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var data := {
	"Coin": {
	"Num_Coin": num_coin
  },
  "Players": [
	{
	  "The_Doge": {
		"Max_HP": Dog.max_hp,
		"HP": Dog.hp,
		"ATK": Dog.atk,
		"SPD": Dog.spd,
		"Pickup_Radius": Dog.pickup_radius,
		"Spacial_Skill": Dog.spacial_skill
	  },
	  "Monkey_Caesar": {
		"Max_HP": Monkey.max_hp,
		"HP": Monkey.hp,
		"ATK": Monkey.atk,
		"SPD": Monkey.spd,
		"Pickup_Radius": Monkey.pickup_radius,
		"Spacial_Skill": Monkey.spacial_skill
	  },
	  "Pepe_The_Frog": {
		"Max_HP": Frog.max_hp,
		"HP": Frog.hp,
		"ATK": Frog.atk,
		"SPD": Frog.spd,
		"Pickup_Radius": Frog.pickup_radius,
		"Spacial_Skill": Frog.spacial_skill
	  }
	}
  ]
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
	num_coin = data.Coin.Num_Coin

#	Dog = TheDog.new()
#	Monkey = MonkeyCaesar.new()
#	Frog = PepeTheFrog.new()
#
#	Dog.max_hp = data.Players.The_Dog.Max_HP
#	Dog.hp = data.Players.The_Dog.HP
#	Dog.atk = data.Players.The_Dog.ATK
#	Dog.spd = data.Players.The_Dog.SPD
#	Dog.pickup_radius = data.Players.The_Dog.Pickup_Radius
#	Dog.spacial_skill = data.Players.The_Dog.Spacial_Skill
#
#	Monkey.max_hp = data.Players.Monkey_Ceasar.Max_HP
#	Monkey.hp = data.Players.Monkey_Ceasar.HP
#	Monkey.atk = data.Players.Monkey_Ceasar.ATK
#	Monkey.spd = data.Players.Monkey_Ceasar.SPD
#	Monkey.pickup_radius = data.Players.Monkey_Ceasar.Pickup_Radius
#	Monkey.spacial_skill = data.Players.Monkey_Ceasar.Spacial_Skill
#
#	Frog.max_hp = data.Players.Pepe_The_Frog.Max_HP
#	Frog.hp = data.Players.Pepe_The_Frog.HP
#	Frog.atk = data.Players.Pepe_The_Frog.ATK
#	Frog.spd = data.Players.Pepe_The_Frog.SPD
#	Frog.pickup_radius = data.Players.Pepe_The_Frog.Pickup_Radius
#	Frog.spacial_skill = data.Players.Pepe_The_Frog.Spacial_Skill
#


	
	



