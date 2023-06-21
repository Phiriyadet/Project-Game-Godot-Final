extends Node2D


const SPAWN_PROPS: Array = [preload("res://Props/Box1.tscn"), preload("res://Props/Box2.tscn"), preload("res://Props/chair.tscn"), preload("res://Props/jar1.tscn"), preload("res://Props/jar2.tscn"), preload("res://Props/jar3.tscn"), preload("res://Props/RIP1.tscn"), preload("res://Props/RIP2.tscn"), preload("res://Props/Rock1.tscn"), preload("res://Props/Rock2.tscn"), preload("res://Props/TMT.tscn"), preload("res://Props/Treasure1.tscn"), preload("res://Props/Treasure2.tscn"), preload("res://Props/Tree1.tscn"), preload("res://Props/TurnL.tscn"), preload("res://Props/TurnR.tscn"),]

onready var props = $Floor/Props as Node2D
onready var map_props = $Floor 
var mapSize = Vector2(800, 800)
var usedPositions = []
var minDistance = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_props()



func _spawn_props():
	var numIterations = 150  # Set the desired number of iterations
	for i in range(numIterations):
			var propInstance = SPAWN_PROPS[randi() % SPAWN_PROPS.size()].instance()
			propInstance.position = _get_random_position()
			props.add_child(propInstance)

func _get_random_position() -> Vector2:
	var randomPosition = Vector2.ZERO
	var isUnique = false

	while not isUnique:
		randomPosition.x = rand_range(0, mapSize.x)
		randomPosition.y = rand_range(0, mapSize.y)

		if not usedPositions.has(randomPosition):
			isUnique = true
			usedPositions.append(randomPosition)

	return randomPosition
