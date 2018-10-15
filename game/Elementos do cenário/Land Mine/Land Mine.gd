extends Area2D

var timer= null
var ataque = 20
var personagem = null

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1.2)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
	set_process(true)
	set_process_input(true)

func _on_Land_Mine_body_entered(inimigo):
	if inimigo.is_in_group("Player"):
		personagem = inimigo
		timer.start() and $Beep.play()
	pass

func on_timeout_complete():
	$BOOM.play()
	if personagem.is_in_group("Player"):
		personagem._receberdano(ataque)
		queue_free()
		personagem.position.x = personagem.position.x-40
	else:
		queue_free()
	pass
