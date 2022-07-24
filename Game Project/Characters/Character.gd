extends KinematicBody2D

class_name Character

const FRICTION: float = 0.15

export(int) var max_hp: int = 2
export(int) var hp: int = 2 setget set_hp
export(int) var atk = 1 
export(int) var spd = 100 
export(float) var crt = 0.25 

signal hp_changed(new_hp)

export(int) var accerelation: int = 40


onready var state_machine: Node = get_node("FiniteStateMachine")
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

var mov_direction: Vector2 = Vector2.ZERO #เปลี่ยนทิศทางการเคลื่อนที่
var velocity: Vector2 = Vector2.ZERO #ความเร็ว


func _physics_process(_delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION) #ค่อยๆ ลดความเร็วลง
	
	
func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * accerelation
	velocity = velocity.clamped(spd) #ไม่เกิน max_speed
	
	
func take_damage(dam: int, dir: Vector2, force: int) -> void:
	if state_machine.state != state_machine.states.hurt and state_machine.state != state_machine.states.dead:
		
		self.hp -= dam
		
		if hp > 0:
			state_machine.set_state(state_machine.states.hurt)
			velocity += dir * force
		else:
			state_machine.set_state(state_machine.states.dead)
			velocity += dir * force * 2
		
		
func set_hp(new_hp: int) -> void:
	hp = clamp(new_hp, 0, max_hp)
	print_debug(hp)
	emit_signal("hp_changed", hp)
