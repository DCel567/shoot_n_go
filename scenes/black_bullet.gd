extends RigidBody2D

@export var speed = 10
var direction = Vector2.RIGHT

func _ready():
	$CollisionParticlesWhite.wait_time = $GPUParticles2D.lifetime

func _physics_process(delta):
	position += speed * direction

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$GPUParticles2D.emitting = true
	$YellowBullet.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionParticlesWhite.start()
	if "hit" in body:
		body.hit()


func _on_collision_particles_white_timeout():
	queue_free()
	
