extends FiniteStateMachine
class_name PlayerFSM 

func _init():
	_add_state("idle")
	_add_state("move")
	_add_state("hurt")
	_add_state("dead")
	
	
func _ready():
	set_state(states.idle)
	
	
func _state_logic(_delta: float):
	if state == states.idle or state == states.move:
		parent.get_input()
		parent.move()
	
	
func _get_transition():
	match state:
		states.idle:
			if parent.velocity.length() > 10:
				return states.move
		states.move:
			if parent.velocity.length() < 10:
				return states.idle
		
	return -1
	
	
func _enter_state(_previous_state: int, new_state: int):
	match new_state:
		states.idle:
			animation_player.play("idle")
		states.move:
			animation_player.play("move")
		states.hurt:
			animation_player.play("hurt")
		states.dead:
			animation_player.play("dead")
