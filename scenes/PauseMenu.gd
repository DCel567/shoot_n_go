extends Control
var paused : bool = false

func _ready():
	hide()

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		show()
		
	paused = !paused


func _on_button_button_up():
	pauseMenu()


func _on_button_2_button_up():
	get_tree().quit()
