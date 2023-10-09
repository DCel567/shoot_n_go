extends Area2D

@export var speed : int
var direction = Vector2.RIGHT

func _physics_process(delta):
	position += speed * direction
