extends State


func enter(_msg := {}):
	print("attack state entered")


# corresponds to _process()
func update(_delta: float) -> void:
	if $"../..".has_target != null:
		print("firing")


# corresponds to _physics_process()
func physics_update(_delta: float) -> void:
	pass


func exit():
	pass
