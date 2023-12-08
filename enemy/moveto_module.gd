extends Node
class_name MovetoModule

var positions: Array
var before_move_timers: Array
var curr_pos: int = 0
var have_positions: bool = false
var positions_amount: int = 0

var moving: bool = false
var holding: bool = false


func _ready():
	curr_pos = 0
	var children = $"..".find_children("move_point*")
	for child in children:
		child as MovePoint
		have_positions = true
		
		positions.push_back(child.get_coords())
		before_move_timers.push_back(child.get_timer())
		get_tree().queue_delete(child)
		positions_amount += 1


func _process(_delta):
	if moving:
		move_to(positions[curr_pos])
	

func start_moving():
	if have_positions:
		moving = true
	
func move_to(glob_pos: Vector2):
	var diff: Vector2 = Vector2(glob_pos)-$"..".global_position
	
	if diff.length() < 3:
		moving = false
		await get_tree().create_timer(before_move_timers[curr_pos]).timeout
		curr_pos = (curr_pos + 1) % positions_amount
		moving = true
		return
		
	var direction = (diff).normalized()
	$"..".velocity = direction * $"..".SPEED
	$"..".move_and_slide()



