extends StaticBody2D

var alvo = Vector2()
var direction = Vector2()
var distance = Vector2()
var eu = Vector2()
onready var pai = get_node("../").position
export(int) var ataque = 1

func _ready():
	#$AnimationPlayer.play("Atirar")
	eu = get_global_transform().get_origin()
	alvo = get_global_mouse_position()
	# Direção do projétil para o alvo
	direction = (alvo - eu).normalized()
	# Distância até o alvo
	distance = alvo - eu
	pass
func _process(delta):
	if(position.y > OS.get_real_window_size().y):
		queue_free()
	if(position.x > OS.get_real_window_size().x):
		queue_free()
func _physics_process(delta):
	# 10 vezes mais rápido
	var velocity = 0.05
	position = (direction / velocity) + position
	pass

func _on_Area2D_body_entered(inimigo):
	if inimigo.is_in_group("inimigos"):
		inimigo._receberdano(ataque)
	pass # replace with function body
