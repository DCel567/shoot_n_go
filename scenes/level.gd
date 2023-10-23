extends Node2D

var black_bullet_scene : PackedScene = preload("res://scenes/black_bullet.tscn")
var reloading_label : PackedScene = preload("res://UI/reloading_sign.tscn")

signal cancel_reload

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	var bullet = reloading_label.instantiate()
	add_child(bullet)
	

func _on_player_player_reload_over():
	$ammo.update_ammo_label()
	remove_child(get_node("reloading_sign"))
	


