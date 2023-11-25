extends CharacterBody2D
class_name Player

signal player_shoot(pos, angle)
signal player_reload_over()
signal player_start_reload()
signal player_died()

@export var speed : int = 400
@export var reload_timer : float = 2

@onready var can_shoot : bool = true
@onready var can_reload : bool = false
@onready var reloading : bool = false

func _ready():
	$shoot_timer.wait_time = 0.1
	$ReloadTimer.wait_time = reload_timer
	Globals.curr_bullet_amount = Globals.max_bullet_amount
	Globals.is_reloading = false

func _process(_delta):
	pass

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	velocity = direction * speed
	move_and_slide()
	
	var player_direction = get_global_mouse_position()
	
	look_at(player_direction)
	
	if Input.is_action_pressed("reload") and can_reload:
		reloading = true
		can_reload = false
		can_shoot = false
		Globals.is_reloading = true
		$ReloadTimer.start()
		player_start_reload.emit()
	
	if Input.is_action_pressed("primary_action") and !reloading and can_shoot and Globals.curr_bullet_amount > 0:
		can_reload = true
		$GPUParticles2D.emitting = true
		Globals.curr_bullet_amount -= 1
		var bullet_direction = (player_direction - position).normalized()
		var bullet_position = $BulletStartPositions.global_position
		can_shoot = false
		$shoot_timer.start()
		
		player_shoot.emit(bullet_position, bullet_direction)


func hit(hit_points):
	$hitbox_module.damage(hit_points)
	

func _on_shoot_timer_timeout():
	can_shoot = true

func _on_reload_timer_timeout():
	Globals.curr_bullet_amount = Globals.max_bullet_amount
	can_shoot = true
	reloading = false
	player_reload_over.emit()
	Globals.is_reloading = false
	

func _on_hp_module_died_event_handler():
	player_died.emit()
