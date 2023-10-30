extends CharacterBody2D
class_name RedSoldier

@export var SPEED : float = 300.0
const RAY_LENGTH = 2000.0

@export var HP_AMOUNT : int = 40

var angle_cone_of_vision = deg_to_rad(60)
var angle_between_rays = deg_to_rad(5)

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
	
	
func hit():
	$hp_module.change(-10)
	
	
func _ready():
	$hp_module.max_hp_amount = HP_AMOUNT
	$hp_module.refill()
	generate_ray_casts()

func _physics_process(delta):
	var target 
	for ray in get_children():
		if ray is RayCast2D:
			if ray.is_colliding() and ray.get_collider() is Player:
				target = ray.get_collider()
				look_at(ray.get_collision_point())
				break
			
	var does_see_player = target != null


