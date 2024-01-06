extends State


#signal player_shoot(pos, angle, bullet_type)
signal player_reload_over()
signal player_start_reload()
signal player_pause_reload()
signal player_continue_reload()
signal player_died()


@onready var can_shoot : bool = true
@onready var can_reload : bool = false
@onready var reloading : bool = false


# Called when the node enters the scene tree for the first time.
func enter(_msg := {}):
	$"../../BlueSoldier".visible = true
	$"../../ReloadTimer".paused = false
	#Globals.is_reloading = true
	can_shoot = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(_delta: float) -> void:
	
	if Input.is_action_pressed("reload") and can_reload \
			and not Input.is_action_pressed("secondary_action"):
		reloading = true
		can_reload = false
		can_shoot = false
		Globals.is_reloading = true
		$"../../ReloadTimer".start()
		player_start_reload.emit()
	
	if Input.is_action_just_pressed("secondary_action"):
		state_machine.transition_to("pistol")
		
	if Input.is_action_pressed("primary_action") and can_shoot and Globals.curr_bullet_amount > 0:
		can_reload = true
		$"../../GPUParticles2D".emitting = true
		Globals.curr_bullet_amount -= 1
		var bullet_direction = ($"../..".player_direction - $"../..".position).normalized()
		var bullet_position = $"../../BulletStartPositions".global_position
		can_shoot = false
		$"../../shoot_timer".start()
		
		$"../..".player_shoot.emit(bullet_position, bullet_direction, "yellow")


func physics_update(_delta: float) -> void:
	pass


func _on_shoot_timer_timeout():
	can_shoot = true
	

func _on_reload_timer_timeout():
	Globals.curr_bullet_amount = Globals.max_bullet_amount
	can_shoot = true
	reloading = false
	player_reload_over.emit()
	Globals.is_reloading = false
	
	
func exit():
	$"../../BlueSoldier".visible = false
	$"../../ReloadTimer".paused = true
	Globals.is_reloading = false
	can_shoot = false
