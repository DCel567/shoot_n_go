extends Node2D
class_name LevelParent

var black_bullet_scene : PackedScene = preload("res://scenes/black_bullet.tscn")

signal cancel_reload

func _ready():
	pass

func _process(delta):
	pass

func _on_player_shoot(pos, direction):
	var bullet = black_bullet_scene.instantiate() as RigidBody2D
	
	bullet.position = pos
	
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + (90 + randi() % 6 - 3)
	bullet.direction = Vector2.from_angle(bullet.rotation - PI/2)
	
	$Projectiles.add_child(bullet)
	$ammo.update_ammo_label()


func _on_player_start_reload():
	pass
	

func _on_player_player_reload_over():
	$ammo.update_ammo_label()

	


