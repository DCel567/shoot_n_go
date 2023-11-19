extends Node
class_name HPModule

@export var max_hp_amount : int = 20
@onready var curr_hp_amount : int = max_hp_amount

signal died_event_handler
signal hp_changed


# Called to change hp. 'hp_changed_by' positive when hp increased 
# and negative otherwise
func change(hp_changed_by : int):

	hp_changed.emit()
	curr_hp_amount += hp_changed_by
	if curr_hp_amount <= 0:
		died_event_handler.emit()
		#get_parent().queue_free()


# Called to fully restore hp
func refill():
	curr_hp_amount = max_hp_amount

