extends KinematicBody2D

onready var player = get_node("../Player")

func _physics_process(delta):
	var direction = (player.position - position).normalized()
	var distance = player.position - position
	print(distance.x)
	if (distance.x >= -196 and distance.x <= 0) or (distance.x <= 196 and distance.x >= 0):
		position.x = (direction.x + position.x)
	pass