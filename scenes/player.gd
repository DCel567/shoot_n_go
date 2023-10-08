extends CharacterBody2D

const SPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	velocity = direction * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("primary_action"):
		print("bullet")
