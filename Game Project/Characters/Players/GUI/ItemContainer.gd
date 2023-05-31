extends TextureRect


### Automatic References Start ###
onready var _item_texture: TextureRect = $ItemTexture
### Automatic References Stop ###
var upgrade = null

func _ready():
	if upgrade != null:
		_item_texture.texture = load(UpgradeDb.UPGRADES[upgrade]["icon"])
