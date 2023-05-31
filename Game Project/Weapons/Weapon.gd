extends Node2D
class_name Weapon

onready var player:  = get_tree().current_scene.get_node("Player").get_child(0)
export(int) var atk_w = 30 setget set_atk_w, get_atk_w #พลังโจมตีจากตัวอาวุธ
onready var animated_sprite : = get_node("Node2D/Sprite")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var hitbox: Area2D = get_node("Node2D/Sprite/Hitbox")
onready var cool_down_timer: Timer = get_node("CoolDownTimer")
var atk_all = 0 setget set_atk_all, get_atk_all #พลังโจมตีทั้งหมดจากตัวอาวุธกับผู้เล่น
export(int) var level_weapon = 1 setget set_newlevel_weapon

func _init():
	pass
	
func _ready():
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

func set_atk_all(new):
	atk_all = new
	
func get_atk_all():
	return atk_all
	
func set_newlevel_weapon(level_weapon:int):
	level_weapon = clamp(level_weapon+1, 1, 7)
