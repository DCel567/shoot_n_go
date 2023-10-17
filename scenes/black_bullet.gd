extends RigidBody2D

@export var speed = 10
var direction = Vector2.RIGHT

func _physics_process(delta):
	position += speed * direction


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#$GPUParticles2D.emitting = true
	queue_free()
