#StartMenu.gd
extends Control

func _on_START_pressed():
	get_tree().change_scene("res://Scenes//Fase1.tscn")

func _on_QUIT_pressed():
	get_tree().quit()
