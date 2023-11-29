extends Control


func _ready():
	hide()


func _process(_delta):
	pass


func _on_button_2_button_up():
	get_tree().quit()


func _on_button_visibility_changed():
	if visible == true:
		#print("visible")
		get_tree().paused = true


func _on_button_button_up():
		get_tree().reload_current_scene()


func _on_main_menu_button_up():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
