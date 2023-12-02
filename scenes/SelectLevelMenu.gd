extends CanvasLayer


func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


func _on_level_1_button_up():
	get_tree().change_scene_to_file("res://Levels/level1.tscn")


func _on_level_2_button_up():
	get_tree().change_scene_to_file("res://Levels/level2.tscn")


func _on_button_button_up():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
