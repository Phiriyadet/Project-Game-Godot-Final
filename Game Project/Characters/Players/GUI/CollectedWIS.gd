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
	if UpgradeDb.UPGRADES[item]["level"] == 7 and UpgradeDb.UPGRADES[item]["type"] != "skill":
		lbl_level.text = "level Max"
	else:
		lbl_level.text = "level "+ str(UpgradeDb.UPGRADES[item]["level"])
	lbl_type.text = UpgradeDb.UPGRADES[item]["type"]
	itemIcon.texture = load(UpgradeDb.UPGRADES[item]["icon"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


