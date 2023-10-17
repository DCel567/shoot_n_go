extends Node2D

var black_bullet_scene : PackedScene = preload("res://scenes/black_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_shoot(pos, direction):
	var bullet = black_bullet_scene.instantiate() as RigidBody2D
	
	bullet.position = pos
	
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + (90 + randi() % 6 - 3)
	bullet.direction = Vector2.from_angle(bullet.rotation - PI/2)
	
	$Projectiles.add_child(bullet)
