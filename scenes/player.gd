extends CharacterBody2D

signal player_shoot()

const SPEED = 400
var can_shoot : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$shoot_timer.wait_time = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	velocity = direction * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("primary_action") and can_shoot:
		player_shoot.emit()
		can_shoot = false
		$shoot_timer.start()


func _on_shoot_timer_timeout():
	can_shoot = true

