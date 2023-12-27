extends CanvasLayer

@onready var ammo_label = $HBoxContainer/Label
@onready var reload_anim_speed : float = $"../Player".reload_timer / 100
@onready var time_passed : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ammo_label.text = str(Globals.curr_bullet_amount) + "/" + str(Globals.max_bullet_amount)
	$ReloadingCircle.set_deferred("visible", false)

func _process(delta):
	if Globals.is_reloading:
		time_passed += delta
		$ReloadingCircle.value = time_passed / reload_anim_speed
	
func update_ammo_label():
	ammo_label.text = str(Globals.curr_bullet_amount) + "/" + str(Globals.max_bullet_amount)
	
func _on_player_start_reload():
	$ReloadingCircle.set_deferred("visible", true)
	$ReloadingCircle.value = 0
	
func _on_player_player_reload_over():
	time_passed = 0
	$ReloadingCircle.set_deferred("visible", false)


func _on_player_pause_reload():
	Globals.is_reloading = false


func _on_player_continue_reload():
	Globals.is_reloading = true
