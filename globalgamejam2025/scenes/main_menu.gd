extends Node





# Called every frame. 'delta' is the elapsed time since the previous frame.

	


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainScene.tscn")


func _on_options_pressed() -> void:
	print('options')


func _on_quit_pressed() -> void:
	print('quit')
	get_tree().quit()
	
