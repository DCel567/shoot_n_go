extends Node
class_name State

var state_machine = null


# corresponds to _process()
func update(_delta: float) -> void:
	pass


# corresponds to _physics_process()
func physics_update(_delta: float) -> void:
	pass
	

func enter(_msg := {}) -> void:
	pass


func exit() -> void:
	pass
