extends KinematicBody2D

class_name Character

const FRICTION: float = 0.15
export(int) var accerelation: int = 20#ความเชื่อย

export(int) var max_hp: int = 100 
export(int) var hp: int = 100 setget set_hp, get_hp
export(int) var atk = 0 setget set_atk, get_atk
export(int) var spd = 100 setget set_spd, get_spd
#export(float) var crt = 0.25 setget set_crt, get_crt
#export(int) var haste = 0 setget set_haste, get_haste

#signal hp_changed(new_hp)



onready var state_machine: Node = get_node("FiniteStateMachine")#สถานะตัวละคร เช่น เดิน วิ่ง
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

var mov_direction: Vector2 = Vector2.ZERO #เปลี่ยนทิศทางการเคลื่อนที่
var velocity: Vector2 = Vector2.ZERO #ความเร็ว


func _physics_process(_delta: float):
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION) #ค่อยๆ ลดความเร็วลง
	
	
func move():
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * accerelation
	velocity = velocity.limit_length(self.spd) #ไม่เกิน max_speed
	
	
func take_damage(dam: int, dir: Vector2, force: int): #รับ damage
	if state_machine.state != state_machine.states.hurt and state_machine.state != state_machine.states.dead:

		self.hp -= dam

		if hp > 0:
			state_machine.set_state(state_machine.states.hurt)
			velocity += dir * force
		else:
			state_machine.set_state(state_machine.states.dead)
			velocity += dir * force * 2
		
		
func set_hp(new_hp):
	hp = clamp(new_hp, 0, max_hp)
#	print_debug(hp)
#	emit_signal("hp_changed", hp)

func get_hp():
	return hp

func set_atk(new_atk):
	atk += new_atk
	
func get_atk():
	return atk
	
func set_spd(new_spd):
	spd = new_spd
	
func get_spd():
	return spd
	
