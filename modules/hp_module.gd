extends Node

@export var max_hp_amount : int = 20
@onready var curr_hp_amount : int = max_hp_amount

# signal just_died # it will become useful when sounds applied and other effects

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
# Called when hp changed. 'hp_changed_by' positive when hp increased 
# and negative otherwise
func change(hp_changed_by : int):
	curr_hp_amount += hp_changed_by
	if curr_hp_amount <= 0:
		get_parent().queue_free()
	
# Called when hp is fully restored
func refill():
	curr_hp_amount = max_hp_amount

