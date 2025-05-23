extends Node

class_name FiniteStateMachine

var states: Dictionary = {}
var previous_state: int = -1
var state: int = -1 setget set_state

onready var parent: Character = get_parent()
onready var animation_player: AnimationPlayer = parent.get_node("AnimationPlayer")


func _physics_process(delta: float):
	if state != -1:
		_state_logic(delta)
		var transition: int = _get_transition()
		if transition != -1:
			set_state(transition)


func _state_logic(_delta: float):
	pass
	
	
func _get_transition():
	return -1


func _add_state(new_state: String):
	states[new_state] = states.size()
	
	
func set_state(new_state: int):
	_exit_state(state)
	previous_state = state
	state = new_state
	_enter_state( state)


func _enter_state( _new_state: int):
	pass
	
	
func _exit_state(_state_exited: int):
	pass
