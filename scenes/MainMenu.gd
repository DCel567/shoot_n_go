extends CanvasLayer


func _ready():
	if get_tree().paused == true:
		get_tree().paused = false

func _on_select_level_button_button_up():
	#get_tree().change_scene_to_file("res://Levels/level2.tscn")
	get_tree().change_scene_to_file("res://scenes/SelectLevelMenu.tscn")


func _on_quit_button_button_up():
	get_tree().quit()
