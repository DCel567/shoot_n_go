extends Node2D
class_name MovePoint

@export var before_move: float = 2.0

func get_coords() -> Vector2:
	return $coords.global_position
	
func get_timer() -> float:
	return before_move
