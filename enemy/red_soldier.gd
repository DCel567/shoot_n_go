extends CharacterBody2D
class_name RedSoldier

@export var SPEED : float = 300.0
const RAY_LENGTH = 2000.0

var angle_cone_of_vision = deg_to_rad(90)
var angle_between_rays = deg_to_rad(5)

var has_target = false


func generate_ray_casts() -> void:
	var ray_count = angle_cone_of_vision / angle_between_rays
	
	for index in ray_count:
		var ray = RayCast2D.new()
		#var vis_ray = Line2D.new()
		var angle = angle_between_rays * (index - ray_count / 2.0)
		
		var ray_end = \
			Vector2.from_angle(angle).normalized() * RAY_LENGTH

		ray.target_position = ray_end
		ray.set_collision_mask_value(3, true)
		add_child(ray)
		ray.enabled = true
		
		#vis_ray.add_point(Vector2(0, 0))
		#vis_ray.add_point(ray_end)
		#add_child(vis_ray)


func hit(hit_points):
	$hitbox_module.damage(hit_points)


func _ready():
	$Exclamation.visible = false
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



