extends Node2D
class_name Weapon

onready var player: Player = get_tree().current_scene.get_node("Player").get_child(0) as Player
export(int) var atk_w = 30 setget set_atk_w, get_atk_w #พลังโจมตีจากตัวอาวุธ
onready var animated_sprite : = get_node("Node2D/Sprite")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var hitbox: Area2D = get_node("Node2D/Sprite/Hitbox")
onready var cool_down_timer: Timer = get_node("CoolDownTimer")
var atk_all = 0 setget set_atk_all, get_atk_all #พลังโจมตีทั้งหมดจากตัวอาวุธกับผู้เล่น
export(int) var level = 0 setget set_newlevel, get_level

func _init():
	pass
	
func _ready():
#	check_level()
	cool_down_timer.start()
	self.atk_all = player.atk + self.atk_w
	
func _process(delta):
	self.atk_all = player.atk + self.atk_w
	hitbox.damage = self.atk_all
#	print("damage:", self.atk_all)
	
#func attack():
#	animation_player.play("attack")
	
func _on_CoolDownTimer_timeout():
#	attack()
	animation_player.play("attack")
	
func set_atk_w(new_atk):
	atk_w = new_atk
	
func get_atk_w():
	return atk_w

func set_atk_all(new_atk_all):
	atk_all = new_atk_all
	
func get_atk_all():
	return atk_all
	
func set_newlevel(old_level:int):
	level = clamp(old_level+1, 1, 7)
	check_level()
	
func get_level() -> int:
	return level
		
func check_level():
	match self.level:
		1,2:
			print_debug("weapon level :", level)
		3,4:
			print_debug("weapon level :", level)
		5,6:
			print_debug("weapon level :", level)
		7:
			print_debug("weapon level :", level)
