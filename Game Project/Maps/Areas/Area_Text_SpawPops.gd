extends Node2D


#const SPAWN_PROPS: Array = [preload("res://Props/jar1.tscn"), preload("res://Props/jar2.tscn"), preload("res://Props/jar3.tscn"),preload("res://Props/Box1.tscn"),preload("res://Props/Box2.tscn")]
const SPAWN_PROPS: Array = [preload("res://Props/Tree1.tscn"),preload("res://Props/Tree1.tscn"), preload("res://Props/TMT.tscn"), preload("res://Props/TurnL.tscn"),preload("res://Props/TurnR.tscn"),preload("res://Props/Rock1.tscn"),preload("res://Props/Rock2.tscn"),preload("res://Props/RIP1.tscn"),preload("res://Props/RIP2.tscn"),preload("res://Props/chair.tscn")]
var BOX = preload("res://Props/Boxx.tscn")
var player
onready var props = $Floor/Props as Node2D
onready var map_props = $Floor
onready var boxs = $Box
var mapSize = Vector2(4000, -2000)
var usedPositions = []
var minDistance = 100
var posi_Max_x = 0
var posi_Max_y = 0
var posi_Min_x = 0
var posi_Min_y = 0
var posi_player = Vector2(0, 0)
var numCheck = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_props(200,2000,-200,-1500,10)
	Global.countBoxs = 0
func _physics_process(delta):
	player = get_tree().current_scene.get_node("Player").get_child(0)
	posi_player = player.get_global_position()
#	print(player.get_global_position())
	if Global.countBoxs < 10:
		var random_number = randi() % 4 + 1
		#ซ้าย
		if random_number == 1:
			_spawn_boxs(-1200,-700,800,-800,1)
		#ขวา
		if random_number == 2:
			_spawn_boxs(1200,700,800,-800,1)
		#บน
		if random_number == 3:
			_spawn_boxs(1200,-1200,-700,-900,1)
		#ล่าง
		if random_number == 4:
			_spawn_boxs(1200,-1200,700,900,1)
		Global.countBoxs+=1
	
	if player.get_global_position().x > posi_Max_x:
		posi_Max_x = player.get_global_position().x
		if numCheck == 50:
			_spawn_props(3000,2000,-200,-1500,2)
			numCheck = 0
		else:
			countNumCheck()
#		print("Max_X = ",posi_Max_x)
	if player.get_global_position().y > posi_Max_y:
		posi_Max_y = player.get_global_position().y
		if numCheck == 50:
			_spawn_props(100,2000,200,-500,2)
			numCheck = 0
		else:
			countNumCheck()
	if player.get_global_position().x < posi_Min_x:
		posi_Min_x = player.get_global_position().x
		if numCheck == 50:
			_spawn_props(100,-500,-200,-1500,2)
			numCheck = 0
		else:
			countNumCheck()
	if player.get_global_position().y < posi_Min_y:
		posi_Min_y = player.get_global_position().y
		if numCheck == 50:
			_spawn_props(100,2000,-1500,-3000,2)
			numCheck = 0
		else:
			countNumCheck()

func countNumCheck():
	if numCheck < 50:
		numCheck +=1
	
func _spawn_props(var x_1, y_1, x_2, y_2, num):
	var numIterations = num  # Set the desired number of iterations
	
	for i in range(numIterations):
			var propInstance = SPAWN_PROPS[randi() % SPAWN_PROPS.size()].instance()
			propInstance.position = posi_player + Vector2(rand_range(x_1, y_1),rand_range(x_2, y_2))
			props.add_child(propInstance)

func _get_random_position() -> Vector2:
	var randomPosition = Vector2.ZERO
	var isUnique = false

	while not isUnique:

		if not usedPositions.has(randomPosition):
			isUnique = true
			usedPositions.append(randomPosition)

	return randomPosition

func _spawn_boxs(var x_1, y_1, x_2, y_2, num):
	var numIterations = num  # Set the desired number of iterations
	
	for i in range(numIterations):
			var propInstance = BOX.instance()
			propInstance.position = posi_player + Vector2(rand_range(x_1, y_1),rand_range(x_2, y_2))
			$".".add_child(propInstance)
