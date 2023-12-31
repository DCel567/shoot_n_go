extends Node2D
class_name LevelParent

var yellow_bullet_scene : PackedScene = preload("res://scenes/black_bullet.tscn")
var red_bullet_scene : PackedScene = preload("res://scenes/yellow_bullet.tscn")
var red_soldier : PackedScene = preload("res://enemy/red_soldier.tscn")


signal cancel_reload

func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
		
	var enemies = get_tree().get_nodes_in_group("Enemies")

	for x in enemies:
		x.enemy_shoot.connect(_on_enemy_shoot)


func _process(_delta):
	pass

func _on_player_shoot(pos, direction, bullet_type):
	var bullet : RigidBody2D
	if bullet_type == "red":
		bullet = red_bullet_scene.instantiate()
	else:
		bullet = yellow_bullet_scene.instantiate()
		
	
	bullet.position = pos
	
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + (90 + randi() % 6 - 3)
	bullet.direction = Vector2.from_angle(bullet.rotation - PI/2)
	
	$Projectiles.add_child(bullet)
	$ammo.update_ammo_label()


func _on_player_start_reload():
	pass
	

func _on_player_player_reload_over():
	$ammo.update_ammo_label()


func _on_enemy_shoot(pos, direction):
	var bullet = yellow_bullet_scene.instantiate() as RigidBody2D
	
	bullet.position = pos
	
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + (90 + randi() % 6 - 3)
	bullet.direction = Vector2.from_angle(bullet.rotation - PI/2)
	
	$Projectiles.add_child(bullet)


func _on_player_died():
	$ammo/DeadMenu.show()

