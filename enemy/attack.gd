extends State

signal enemy_shoot(pos, angle)

var now_shooting: bool = false # illustrates if red_soldier is shooting
var can_shoot: bool = true

var look_direction : Vector2

func enter(_msg := {}):
	print("attack state entered")


# corresponds to _process()
func update(_delta: float) -> void:
	look_direction = $"../..".look_direction
	
	if $"../..".has_target == true and !now_shooting:
		$"../../BurstTimer".start()
		now_shooting = true


# corresponds to _physics_process()
func physics_update(_delta: float) -> void:
	pass


func _on_shoot_timer_timeout():
	pass # Replace with function body.


func make_burst():
	var shots_fired_in_burst = 0
	
	while shots_fired_in_burst < 5:
		#print("shot fired ", shots_fired_in_burst)
		var bullet_direction = (look_direction - $"../..".position).normalized()
		var bullet_position = $"../../BulletStartPositions".global_position
		enemy_shoot.emit(bullet_position, bullet_direction)
		#print("shoot: ", bullet_direction, ", " , bullet_position)
		$"../../shoot_timer".start()
		await $"../../shoot_timer".timeout
		shots_fired_in_burst += 1



func _on_burst_timer_timeout():
	make_burst()
	now_shooting = false
	


func exit():
	pass
