extends Control

var tween: Tween
@onready var colors = $ButtonControl/Button/Colors


func _ready():
	pass # Replace with function body.


func hover_on() -> void:
	if tween and tween.is_running():
		tween.kill()
		
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	var idx : int = 0
	for c in colors.get_children():
		tween.parallel().tween_property(c, "position:y", 0.0, 
			0.3 + idx * randf_range(0.08, 0.15))
		idx += 1
	
	
func hover_off() -> void:
	if tween and tween.is_running():
		tween.kill()
		
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	for i in range(colors.get_child_count()-1, -1, -1):
		var c = colors.get_child(i)
		tween.parallel().tween_property(c, "position:y", c.size.y, 
			0.7 - i * randf_range(0.08, 0.15))



func _on_button_mouse_entered():
	hover_on()


func _on_button_mouse_exited():
	hover_off()
