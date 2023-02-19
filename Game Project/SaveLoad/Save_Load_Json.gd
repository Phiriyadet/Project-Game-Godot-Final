extends Resource

var pathSave="user://save_game.json";

var file_data = [
	{
		"Players": [
			{
				"ID_Character": "001",
				"Name": "Doge",
				"HP": 50,
				"ATK": 15,
				"SPD": 50,
				"Pickup_Radius": 20,
				"Spacial_Skill": false
			},
			{
				"ID_Character": "002",
				"Name": "Monkey caesar",
				"HP": 40,
				"ATK": 20,
				"SPD": 50,
				"Pickup_Radius": 20,
				"Spacial_Skill": false
			},
			{
				"ID_Character": "003",
				"Name": "Pepe the frog",
				"HP": 50,
				"ATK": 10,
				"SPD": 60,
				"Pickup_Radius": 20,
				"Spacial_Skill": false
			}
		],
		"Coin": {
			"Num_Coin": 0
		}
	}
]


func _ready():
	pass # Replace with function body.


#func _process(delta):
#	pass

func save():
	var file = File.new()

func load():
	pass
