extends Control


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://src/levels/game.tscn")
	

func _on_quit_game_pressed():
	get_tree().quit()
