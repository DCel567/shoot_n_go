extends Area2D

@export var hp_module : HPModule


func damage(amount: int):
	if hp_module:
		hp_module.change(amount)
	else:
		print("no hp module")


