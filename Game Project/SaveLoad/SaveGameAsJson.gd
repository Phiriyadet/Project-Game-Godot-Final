
extends Reference

class_name SaveGameAsJson

const SAVE_GAME_PATH := "user://save.json"
const COIN_DATA_PATH := "user://coin.json"

var version := 1

var	Dog = TheDoge.new()
var	Monkey = MonkeyCaesar.new()
var	Frog = PepeTheFrog.new()
var num_coin = 0

var _file := File.new()


func save_exists() -> bool:
	return _file.file_exists(SAVE_GAME_PATH)

func money_exists() -> bool:
	return _file.file_exists(COIN_DATA_PATH)
	
func write_savecoin_init():
	var error := _file.open(COIN_DATA_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [COIN_DATA_PATH, error])
		return
	var data := {"Coin":{
		"Num_Coin": 0
	  },}
	
func write_savegame_init():
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return
	
	var data := {
	  "Players": 
		{
		  "The_Doge": {
		"Max_HP": 50,
		"HP": 50,
		"ATK": 15,
		"SPD": 50,
		"Pickup_Radius": 20,
		"Spacial_Skill": false,
		"Collected_Coin": 0
	  },
	  "Monkey_Caesar": {
		"Max_HP": 40,
		"HP": 40,
		"ATK": 20,
		"SPD": 50,
		"Pickup_Radius": 20,
		"Spacial_Skill": false,
		"Collected_Coin": 0
	  },
	  "Pepe_The_Frog": {
		"Max_HP": 50,
		"HP": 50,
		"ATK": 10,
		"SPD": 60,
		"Pickup_Radius": 20,
		"Spacial_Skill": false,
		"Collected_Coin": 0
	  },
		},
	  }
		
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()

func write_savecoin():
	var error := _file.open(COIN_DATA_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [COIN_DATA_PATH, error])
		return
	var data := {"Coin":{
		"Num_Coin": num_coin
	  },}
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()
	
func write_savegame():
	var error := _file.open(SAVE_GAME_PATH, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var data := {
  "Players": 
	{
	  "The_Doge": {
		"Max_HP": Dog.max_hp,
		"HP": Dog.hp,
		"ATK": Dog.atk,
		"SPD": Dog.spd,
		"Pickup_Radius": Dog.pickup_radius,
		"Spacial_Skill": Dog.spacial_skill,
		"Collected_Coin": Dog.collected_coin
	  },
	  "Monkey_Caesar": {
		"Max_HP": Monkey.max_hp,
		"HP": Monkey.hp,
		"ATK": Monkey.atk,
		"SPD": Monkey.spd,
		"Pickup_Radius": Monkey.pickup_radius,
		"Spacial_Skill": Monkey.spacial_skill,
		"Collected_Coin": Dog.collected_coin
	  },
	  "Pepe_The_Frog": {
		"Max_HP": Frog.max_hp,
		"HP": Frog.hp,
		"ATK": Frog.atk,
		"SPD": Frog.spd,
		"Pickup_Radius": Frog.pickup_radius,
		"Spacial_Skill": Frog.spacial_skill,
		"Collected_Coin": Dog.collected_coin
	  },
	},
  }
	
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()

func load_savecoin():
	var error := _file.open(COIN_DATA_PATH, File.READ)
	if error != OK:
		printerr("Could not open the file %s. Aborting load operation. Error code: %s" % [COIN_DATA_PATH, error])
		return
	
	var content := _file.get_as_text()
	_file.close()

	var data: Dictionary = JSON.parse(content).result
	
	num_coin = data.Coin.Num_Coin
	
func load_savegame():
	var error := _file.open(SAVE_GAME_PATH, File.READ)
	if error != OK:
		printerr("Could not open the file %s. Aborting load operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return

	var content := _file.get_as_text()
	_file.close()

#	var data: Dictionary = JSON.parse(content).result
#
#	Dog.max_hp = data.Players.The_Doge.Max_HP
#	Dog.hp = data.Players.The_Doge.HP
#	Dog.atk = data.Players.The_Doge.ATK
#	Dog.spd = data.Players.The_Doge.SPD
#	Dog.pickup_radius = data.Players.The_Doge.Pickup_Radius
#	Dog.spacial_skill = data.Players.The_Doge.Spacial_Skill
#	Dog.collected_coin = data.Players.The_Doge.Collected_Coin
#
#	Monkey.max_hp = data.Players.Monkey_Caesar.Max_HP
#	Monkey.hp = data.Players.Monkey_Caesar.HP
#	Monkey.atk = data.Players.Monkey_Caesar.ATK
#	Monkey.spd = data.Players.Monkey_Caesar.SPD
#	Monkey.pickup_radius = data.Players.Monkey_Caesar.Pickup_Radius
#	Monkey.spacial_skill = data.Players.Monkey_Caesar.Spacial_Skill
#	Monkey.collected_coin = data.Players.Monkey_Caesar.Collected_Coin
#
#	Frog.max_hp = data.Players.Pepe_The_Frog.Max_HP
#	Frog.hp = data.Players.Pepe_The_Frog.HP
#	Frog.atk = data.Players.Pepe_The_Frog.ATK
#	Frog.spd = data.Players.Pepe_The_Frog.SPD
#	Frog.pickup_radius = data.Players.Pepe_The_Frog.Pickup_Radius
#	Frog.collected_coin = data.Players.Pepe_The_Frog.Spacial_Skill
#	Frog.collected_coin = data.Players.Pepe_The_Frog.Collected_Coin
#
