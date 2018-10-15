extends KinematicBody2D
var motion = Vector2()
func _process(delta):
	if position.x >= 992 and position.x <= 1000:
		motion.x = -70
		print ("voltando")
	if position.x >= 608 and position.x <= 610:
		motion.x = 70
		print ("indo")
	motion = move_and_slide(motion)
	pass
	