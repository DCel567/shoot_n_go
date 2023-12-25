extends RigidBody2D


@export var speed = 20
@export var dmg_amount = 35
var direction = Vector2.RIGHT

func _ready():
	$CollisionParticlesWhite.wait_time = $GPUParticles2D.lifetime

func _physics_process(_delta):
	position += speed * direction

func _on_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	$GPUParticles2D.emitting = true
	$YellowBullet.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionParticlesWhite.start()
	
	if body.has_node("hitbox_module"):
		body.hit(-dmg_amount)


func _on_collision_particles_white_timeout():
	queue_free()


func _on_life_time_timer_timeout():
	queue_free()
