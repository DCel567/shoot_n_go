extends State


# Called when the node enters the scene tree for the first time.
func enter(_msg := {}):
	print("primary")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("secondary_action"):
		state_machine.transition_to("pistol")


func physics_update(_delta: float) -> void:
	pass

	
func exit():
	print("primary exited")
