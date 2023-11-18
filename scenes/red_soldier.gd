extends CharacterBody2D
class_name RedSoldier

@export var SPEED : float = 300.0
const RAY_LENGTH = 2000.0

var angle_cone_of_vision = deg_to_rad(60)
var angle_between_rays = deg_to_rad(5)

enum States { IDLE, ATTACK, SEEK }
# soldier is IDLE if he never previously seen player
# soldier is ATTACK if he is looking at the player right now
# soldier is SEEK if he is aware of player's presence

var _state : int = States.IDLE

var has_target = false


func generate_ray_casts() -> void:
	var ray_count = angle_cone_of_vision / angle_between_rays
	
	for index in ray_count:
		var ray = RayCast2D.new()
		var angle = angle_between_rays * (index - ray_count / 2.0)
		var ray_end = \
			Vector2.from_angle(rotation+angle).normalized() * RAY_LENGTH
		
		ray.target_position = ray_end
		ray.set_collision_mask_value(3, true)
		add_child(ray)
		ray.enabled = true


func hit(hit_points):
	$hitbox_module.damage(hit_points)


func _ready():
	generate_ray_casts()


func _physics_process(_delta):
	
	var target 
	for ray in get_children():
		if ray is RayCast2D:
			if ray.is_colliding() and ray.get_collider() is Player:
				target = ray.get_collider()
				look_at(ray.get_collision_point())
				break
			
	has_target = target != null



