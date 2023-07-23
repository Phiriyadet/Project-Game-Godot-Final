extends Control


onready var score = $ColorRect/Score as Label
onready var coin = $ColorRect/Coin as Label
var _save := SaveGameAsJson.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.victory == 1:
		var tree = get_tree()
		tree.paused = true
		score.text = str((Global.enemy_dead_count*100)+((Global.level_player-1)*2000))
		coin.text = str(((Global.enemy_dead_count*100)+((Global.level_player-1)*2000))/1000)
		_save.num_coin =+ int(coin.text)
		_save.write_savecoin()
		show()


func _on_BackToMenu_pressed():
	var tree = get_tree()
	tree.paused = false
	get_tree().change_scene("res://Menus/MainMenu.tscn")
