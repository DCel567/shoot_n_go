extends State


func enter(_msg := {}):
	pass


# corresponds to _process()
func update(_delta: float) -> void:
	if $"../..".has_target != false:
		state_machine.transition_to("attack")


# corresponds to _physics_process()
func physics_update(_delta: float) -> void:
	pass


func exit():
	await exclamation()


func exclamation():
	$"../../Exclamation".visible = true
	await get_tree().create_timer(0.5).timeout
	$"../../Exclamation".visible = false
	
