extends Control


func _ready():
	hide()

func _process(_delta):
	pass




func _on_button_button_down():
	print("restart")


func _on_button_2_button_up():
	print("quit up")
	get_tree().quit()
