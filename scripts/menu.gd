extends Node2D




func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_credits_pressed() -> void:
	$Label/CenterContainer/main.visible = false
	$Label/CenterContainer/Credits.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Label/CenterContainer/main.visible = true
	$Label/CenterContainer/Credits.visible = false
