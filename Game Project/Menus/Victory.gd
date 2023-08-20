extends Control


onready var score = $ColorRect/Score as Label
onready var coin = $ColorRect/Coin as Label
var _save := SaveGameAsJson.new()
var once = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.victory == 1 and once == 0:
		once +=1
		var tree = get_tree()
		tree.paused = true
		
#		var total_score = (Global.enemy_dead_count * 100) + ((Global.level_player - 1) * 2000)
#		var num_coin = total_score / 1000
#		var bonus1 = num_coin * Global.bonus_coin
#		var bonus2 = num_coin * Global.coin_bonus_diffl
#
#		var total_coin = num_coin + bonus1 + bonus2
		
		score.text = str(Global.total_score)
		coin.text = str(Global.total_coin)
		
		print_debug("Global total coin", Global.total_coin)
		_save.num_coin_up = int(Global.total_coin)
		_save.load_savecoin()
		_save.write_savecoin()
		show()


func _on_BackToMenu_pressed():
	var tree = get_tree()
	tree.paused = false
	get_tree().change_scene("res://Menus/MainMenu.tscn")
