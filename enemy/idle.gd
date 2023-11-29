extends State

@onready var need_turn_around = $"../..".need_turnaround_on_idle
@onready var need_random_delay = $"../..".random_turnaround_delay

func enter(_msg := {}):
	if need_turn_around:
		if need_random_delay:
			var turn_around_delay = randf_range(0.1, 0.5)
			await get_tree().create_timer(turn_around_delay).timeout

		$"../../turn_around_timer".start()


# corresponds to _process()
func update(_delta: float) -> void:
	if $"../..".has_target != false:
		state_machine.transition_to("attack")


# corresponds to _physics_process()
func physics_update(_delta: float) -> void:
	pass


func exit():
	$"../../turn_around_timer".stop()
	await exclamation()


func exclamation():
	$"../../Exclamation".visible = true
	await get_tree().create_timer(0.5).timeout
	$"../../Exclamation".visible = false
	


func _on_turn_around_timer_timeout():
	$"../..".rotation += PI
