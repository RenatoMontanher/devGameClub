extends KinematicBody2D
#movimento
var vida = 1
onready var player = get_node("../Player")
#dano
export(int)var ataque = 10
var proj = preload("res://Inimigos/Atirador/ProjetilAtirado.tscn")


#dano
func _receberdano(ataque):
	vida = vida-ataque
	if vida <= 0:
		vida = 0
	if vida == 0:
		queue_free()
	pass
#timer
var timer = null
var delay = 1.5
var can_shoot = true
func _ready():

	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout",self,"on_timeout_complete")
	add_child(timer)
func on_timeout_complete():
	can_shoot=true





#tiro
func _on_Player_vivo():
	var distance = player.position - position
	#print(distance.x)
	if (distance.x >= -300 and distance.x <= 0 and (distance.y >= -100 and distance.y <=100)) and can_shoot==true:
		can_shoot=false
		timer.start()
		var projetil = proj.instance()
		add_child(projetil)
	pass

