extends Control
var dead: bool = false

func _ready():
	hide()

func _process(_delta):
	pass



func _on_button_2_button_up():
	print('quit pressed')
	get_tree().paused = false
	get_tree().quit()
