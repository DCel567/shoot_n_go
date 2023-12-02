extends Node
class_name MovetoModule

var positions: Array
var curr_pos: int = 0
var have_positions: bool = false
var positions_amount: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_pos = 0
	var children = $"..".find_children("move_point*")
	for child in children:
		child as MovePoint
		have_positions = true
		
		positions.push_back(child.get_coords())
		positions_amount += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
