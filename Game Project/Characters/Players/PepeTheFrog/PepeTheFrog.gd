extends "res://Characters/Players/Player.gd"


class_name PepeTheFrog , "res://Assets/Characters/Players/Pepe/pepe-idle-1.png"

# Called when the node enters the scene tree for the first time.
func _ready():
#	self.max_hp = 50
#	self.hp = 50
#	self.atk = 10
#	self.spd = 6000
#	self.pickup_radius = 20
#	self.spacial_skill = false
	#weapons
	upgrade_character("BonkBat")
#	upgrade_character("BonkMissile")
#	upgrade_character("GunHand")
	upgrade_character("Nokia3310")
#	upgrade_character("Punch")
#	upgrade_character("TwoGuitars")
	
	#skills
	upgrade_character("Ameno")
	upgrade_character("Family")
	upgrade_character("Gigachad")
	upgrade_character("GottaGoFast")
#	upgrade_character("Rickroll")
#	upgrade_character("ThisIsFine")
	
	#items
	upgrade_character("Amogus")
	upgrade_character("NanomachinesSon")
	upgrade_character("SuezCanalJam")
	upgrade_character("TakeMyMoney")
#	upgrade_character("TheMotivation")
#	upgrade_character("ThePumpkinDance")
