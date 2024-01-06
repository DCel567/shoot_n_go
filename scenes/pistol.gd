extends State


#signal player_shoot(pos, angle, bullet_type)


@onready var pistol_ready : bool = true


func enter(_msg := {}):
	$"../../PistolSprite".visible = true


func update(_delta: float) -> void:
	if Input.is_action_just_released("secondary_action"):
		state_machine.transition_to("primary_weapon")
	
	if pistol_ready:
		var laser = $"../../Laser".get_children()
		if len(laser) == 0:
			var vis_ray = Line2D.new()
			vis_ray.width = 5
			vis_ray.default_color = Color(Color.DARK_RED, 0.5)
			
			vis_ray.add_point(Vector2(0, 0))
			vis_ray.add_point(Vector2.RIGHT * 2400)
			$"../../Laser".add_child(vis_ray)
	


func physics_update(_delta: float) -> void:
	pass

	
func exit():
	$"../../PistolSprite".visible = false
	
	if pistol_ready:
		get_tree().queue_delete($"../../Laser".get_child(0))
		
		var bullet_direction = ($"../..".player_direction - $"../..".position).normalized()
		var bullet_position = $"../../BulletStartPositions".global_position
		
		$"../..".player_shoot.emit(bullet_position, bullet_direction, "red")
		pistol_ready = false
		await get_tree().create_timer(5).timeout
		pistol_ready = true
	
