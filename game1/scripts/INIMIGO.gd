extends KinematicBody2D
#movimento
var motion = Vector2()
var vida = 1
onready var player = get_node("../Player")
#dano
var ataque = 10

"movimento"

"vida"
func _on_hitbox_body_entered(inimigo):
	
	print ("encostou")
	if inimigo.is_in_group("Player"):
		inimigo._receberdano(ataque)
	
	pass

func _receberdano(ataque):
	vida = vida-ataque
	if vida <= 0:
		vida = 0
	if vida == 0:
		queue_free()
	pass


func _on_Player_vivo():
	motion.y += 10
	var direction = (player.position - position).normalized()
	var distance = player.position - position
	#print(distance.x)
	if (distance.x >= -300 and distance.x <= 0) or (distance.x <= 300 and distance.x >= 0):
		position.x = (direction.x + position.x)
		
		
		motion = move_and_slide(motion)
	pass 
