
extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Player"):
			get_tree().change_scene("Mundo3.tscn")

	pass