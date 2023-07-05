extends ColorRect

onready var lbl_name = $lbl_name
onready var lbl_desription = $lbl_description
onready var lbl_level = $lbl_level
onready var lbl_type = $lbl_type
onready var itemIcon = $ColorRect/ItemIcon

var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	lbl_name.text = UpgradeDb.UPGRADES[item]["displayname"]
	lbl_desription.text = UpgradeDb.UPGRADES[item]["details"]
	lbl_level.text = "level "+ str(UpgradeDb.UPGRADES[item]["level"])
	lbl_type.text = UpgradeDb.UPGRADES[item]["type"]
	itemIcon.texture = load(UpgradeDb.UPGRADES[item]["icon"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
