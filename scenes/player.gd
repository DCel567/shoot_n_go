extends CharacterBody2D

signal player_shoot(pos, angle)
signal player_reload_over()

@export var speed : int = 400
@export var reload_timer : int = 4
var can_shoot : bool = true
var can_reload : bool = true

func _ready():
	$shoot_timer.wait_time = 0.1
	$ReloadTimer.wait_time = reload_timer

func _process(delta):
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	velocity = direction * speed
	move_and_slide()
	
	var player_direction = get_global_mouse_position()
	
	look_at(player_direction)
	
	if Input.is_action_pressed("reload") and can_reload:
		can_reload = false
		can_shoot = false
		$ReloadTimer.start()
	
	if Input.is_action_pressed("primary_action") and can_reload and can_shoot and Globals.curr_bullet_amount > 0:
		$GPUParticles2D.emitting = true
		Globals.curr_bullet_amount -= 1
		var bullet_direction = (player_direction - position).normalized()
		var bullet_position = $BulletStartPositions.global_position
		can_shoot = false
		$shoot_timer.start()
		
		player_shoot.emit(bullet_position, bullet_direction)


func _on_shoot_timer_timeout():
	can_shoot = true

func _on_reload_timer_timeout():
	Globals.curr_bullet_amount = Globals.max_bullet_amount
	can_shoot = true
	can_reload = true
	player_reload_over.emit()
	
