extends Node
class_name MovetoModule

var positions: Array
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
		get_tree().queue_delete(child)
		positions_amount += 1


func _process(_delta):
	if moving:
		var direction = (Vector2(positions[0])-$"..".global_position).normalized()
		$"..".velocity = direction * $"..".SPEED
		$"..".move_and_slide()
	

func start_moving():
	moving = true
	




