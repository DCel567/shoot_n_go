extends State


func enter(_msg := {}):
	print("pistol")


func update(_delta: float) -> void:
	if Input.is_action_just_released("secondary_action"):
		state_machine.transition_to("primary_weapon")


func physics_update(_delta: float) -> void:
	pass

	
func exit():
	print("pistol exited")
