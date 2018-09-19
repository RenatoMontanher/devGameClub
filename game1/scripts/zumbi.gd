extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.75

func _ready():
	$Inimigo.play("Walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 120
	
func _process(delta):
	
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Inimigo.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Inimigo.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true
			
func dano():
	get_node("Inimigo").play("Death")
	get_node("Anim").play("Die")

func Die():
	$".".queue_free()
