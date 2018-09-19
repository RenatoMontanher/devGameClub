extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene("res://Scenes/Fase2.tscn")
			
			
	# Called every time the node is added to the scene.
	# Initialization here
	pass

