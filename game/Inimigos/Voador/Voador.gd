extends KinematicBody2D
#movimento
var motion = Vector2()
var vida = 1
onready var player = get_node("../Player")
#dano
export(int)var ataque = 10
var  body = "../Player"
var below = false

#timer
var timer = null
var delay = 5
var damage = true
"movimento"
func _ready():
	$AnimationPlayer.play("idle")
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout",self,"on_timeout_complete")
	add_child(timer)
func _receberdano(ataque):
	vida = vida-ataque
	if vida <= 0:
		vida = 0
	if vida == 0:
		queue_free()
	
	pass
func on_timeout_complete():
	damage = true


func _on_Player_vivo():

	var direction = (player.position - position).normalized()
	var distance = player.position - position
	#print(distance.x)
	if (distance.x >= -300 and distance.x <= 0) or (distance.x <= 300 and distance.x >= 0):
		position.x = (direction.x + position.x)
	if (distance.y >= -300 and distance.y <= -100) or (distance.y <= 300 and distance.y >= 100):
		position.y = (direction.y + position.y)
	if distance.y >= 50 and distance.y <75: 
		position.y = (position.y - direction.y)


		
		
		motion = move_and_slide(motion)
	pass



func _on_Area2D_body_entered(inimigo):
	if inimigo.is_in_group("Player"):
		print ("player")
		if damage == true:
			inimigo._receberdano(ataque)
			damage = false
			timer.start()
				
	pass # replace with function body



		
	