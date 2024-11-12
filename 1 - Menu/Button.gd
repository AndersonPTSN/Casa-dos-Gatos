extends Button


func _on_pressed():
	var video = get_node("/root/Menu/Video")
	video.play()
	var audio = get_node("/root/Menu/AudioStreamPlayer")
	audio.stop()
	var button = get_node("/root/Menu/Button")
	button.position.x = 10000
	await get_tree().create_timer(58).timeout
	get_tree().change_scene_to_file("res://Fase_1/fase_1.tscn")
	
