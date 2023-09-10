extends ColorRect

onready var lbl_name = $Details/lbl_name
onready var lbl_desription = $Details/lbl_description
onready var lbl_level = $Details/lbl_level
onready var lbl_type = $Details/lbl_type
onready var itemIcon = $ItemIcon
onready var details = $Details

var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	lbl_name.text = UpgradeDb.UPGRADES[item]["displayname"]
	lbl_desription.text = UpgradeDb.UPGRADES[item]["details"]
	lbl_level.text = "level "+ str(clamp(UpgradeDb.UPGRADES[item]["level"], 1, 7))
	lbl_type.text = UpgradeDb.UPGRADES[item]["type"]
	itemIcon.texture = load(UpgradeDb.UPGRADES[item]["icon"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


