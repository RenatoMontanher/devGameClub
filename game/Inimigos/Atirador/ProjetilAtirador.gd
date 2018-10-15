extends StaticBody2D

var alvo = Vector2()
var direction = Vector2()
var distance = Vector2()
var eu = Vector2()
onready var pai = get_node("../").position
export(int) var ataque = 7

func _physics_process(delta):
	position.x += -2
	pass

func _on_Area2D_body_entered(inimigo):
	if inimigo.is_in_group("Player"):
		inimigo._receberdano(ataque)
		queue_free()
	pass # replace with function body
