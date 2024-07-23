extends Control

var selected_character = null

func _on_player_a_pressed():
	selected_character = "Biker"


func _on_player_b_pressed():
	selected_character = "Biker"


func _on_ok_pressed():
	if selected_character != null:
		Global.selected_character = selected_character
		get_tree().change_scene_to_file("res://src/levels/game.tscn")
	else:
		print("Please select a character")


func _on_player_c_pressed():
	selected_character = null


func _on_player_d_pressed():
	selected_character = null


func _on_player_e_pressed():
	selected_character = null
