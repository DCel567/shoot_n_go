extends State

signal enemie_shoot(pos, angle)

var shot_fire: bool = false
var shots_fired_in_burst : int = 0

func enter(_msg := {}):
	$shoot_timer.wait_time = 0.1
	print("attack state entered")


# corresponds to _process()
func update(_delta: float) -> void:
	if $"../..".has_target == true:
		if !shot_fire:
			$"../../BurstTimer".start()
			shot_fire = true


# corresponds to _physics_process()
func physics_update(_delta: float) -> void:
	pass


func _on_shoot_timer_timeout():
	pass # Replace with function body.


func _on_burst_timer_timeout():
	shot_fire = false
	print("shot fired")
	



func exit():
	pass
