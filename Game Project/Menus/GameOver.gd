extends Control


onready var score = $ColorRect/Score as Label
onready var coin = $ColorRect/Coin as Label
var _save := SaveGameAsJson.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.player_dead:
		var tree = get_tree()
		tree.paused = true
		score.text = str((Global.enemy_dead_count*100)+((Global.level_player-1)*2000))
		var num_coin = ((Global.enemy_dead_count*100)+((Global.level_player-1)*2000))/1000
		var bonus1 = (((Global.enemy_dead_count*100)+((Global.level_player-1)*2000))/1000) * Global.bonus_coin
		var bonus2 = (((Global.enemy_dead_count*100)+((Global.level_player-1)*2000))/1000) * Global.coin_bonus_diffl
		coin.text = str(num_coin + bonus1 + bonus2)
		_save.num_coin =+ int(coin.text)
		_save.write_savecoin()
		show()


func _on_BackToMenu_pressed():
	var tree = get_tree()
	tree.paused = false
	get_tree().change_scene("res://Menus/MainMenu.tscn")
