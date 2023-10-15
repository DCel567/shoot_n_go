extends CharacterBody2D

signal player_shoot(pos, angle)

@export var speed : int = 400
var can_shoot : bool = true


func _ready():
	$shoot_timer.wait_time = 0.1

func _process(delta):
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	velocity = direction * speed
	move_and_slide()
	
	var player_direction = get_global_mouse_position()
	
	look_at(player_direction)
	
	if Input.is_action_pressed("primary_action") and can_shoot:
		$GPUParticles2D.emitting = true
		var bullet_direction = (player_direction - position).normalized()
		var bullet_position = $BulletStartPositions.global_position
		can_shoot = false
		$shoot_timer.start()
		
		player_shoot.emit(bullet_position, bullet_direction)


func _on_shoot_timer_timeout():
	can_shoot = true

