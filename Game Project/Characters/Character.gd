extends KinematicBody2D

class_name Character

# Constant for friction
const FRICTION: float = 0.15

# Acceleration of the character
export(int) var acceleration: int = 20

# Maximum and current hitpoints of the character
export(int) var max_hp: int = 100  setget set_maxhp, get_maxhp
export(int) var hp: int = 100 setget set_hp, get_hp

# Attack power of the character
export(int) var atk = 0 setget set_atk, get_atk
export(int) var plus_atk = 0

# Speed of the character
export(int) var spd = 100 setget set_spd, get_spd

# Signals for when hp changes 
signal hp_changed


# Reference to the FiniteStateMachine and AnimatedSprite nodes
onready var state_machine: Node = get_node("FiniteStateMachine")
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

# Vector for movement direction and velocity
var mov_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO


func _physics_process(_delta: float):
	 # Move and slide the character based on their velocity
	velocity = move_and_slide(velocity)
	# Slowly decrease the velocity over time using lerp
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
	
func move():
	# Normalize the movement direction and update the character's animation and velocity based on it
	mov_direction = mov_direction.normalized()
	
	# Flip the animation if the character is moving left
	if spd != 0:
		if mov_direction.x < 0:
			animated_sprite.flip_h  = true
		# Unflip the animation if the character is moving right
		if mov_direction.x > 0:
			animated_sprite.flip_h  = false
			
	# Increase the velocity based on the movement direction and acceleration
	velocity += mov_direction * acceleration
	# Limit the velocity to the character's max speed
	velocity = velocity.limit_length(self.spd)
	
	
func take_damage(dam: int, dir: Vector2, force: int): #รับ damage
	# Check if the character is not already in a hurt or dead state
	if state_machine.state != state_machine.states.hurt and state_machine.state != state_machine.states.dead:
		# Decrement the hitpoints by the damage amount
		self.hp -= dam
		# Check if the character is still alive
		if hp > 0:
			# If the character is in the player group, emit the hp_changed signal
			if is_in_group("player"):
				emit_signal("hp_changed")
			# Set the state machine to the hurt state
			state_machine.set_state(state_machine.states.hurt)
			# Increase the velocity based on the direction and force of the attack
			velocity += dir * force
		else:
			if is_in_group("player"):
				print("player dead")
				Global.player_dead = true
			if is_in_group("enemy"):
				Global.enemy_dead_count+=1
				Global.num0 -=1
#				print("enemy dead")
			state_machine.set_state(state_machine.states.dead)
			velocity += dir * force * 2
		
		
func set_hp(new_hp:int):
	hp = clamp(new_hp, 0, self.max_hp)
#	print_debug(hp)
	
func get_hp():
	return hp
	
func set_maxhp(new_maxhp:int):
	max_hp = new_maxhp

func get_maxhp():
	return max_hp

func set_atk(new_atk):
	atk = new_atk
	
func get_atk():
	return atk
	
func set_spd(new_spd):
	spd = new_spd
	
func get_spd():
	return spd
	
