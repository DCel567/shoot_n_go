extends CanvasLayer

@onready var ammo_label = $HBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	ammo_label.text = str(Globals.curr_bullet_amount) + "/" + str(Globals.max_bullet_amount)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_ammo_label():
	ammo_label.text = str(Globals.curr_bullet_amount) + "/" + str(Globals.max_bullet_amount)
