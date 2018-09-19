extends KinematicBody2D
#movimento
const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 80
const MAX_SPEED = 250
const JUMP_HEIGHT = -500
var motion = Vector2()
#movimento




#vida
#export(int) var vida = 30
signal atualizar_vida(vida)
signal vivo()


#vida
#ataque


var frente = true
var tras = false
signal ataque()
func _process(delta):
	if global.vida >= 1:
		emit_signal("vivo")
	if Input.is_action_just_pressed("space"):
		emit_signal("ataque")
	if frente == true:
		$Sprite.set_scale(Vector2(1,1))
	if tras == true:
		$Sprite.set_scale(Vector2(-1,1))

#ataque
	
func _ready():
	emit_signal("atualizar_vida", global.vida)
	
	
	
	pass
	"movimento"
func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("d"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		frente = true
		tras = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("a"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		tras = true
		frente = false
		$Sprite.play("Run")
	else :
		$Sprite.play("Idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	
	if is_on_floor():
		if Input.is_action_just_pressed("w"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		$Sprite.play("Jump")
	
	motion = move_and_slide(motion, UP)
	pass



"Código antigo vida"
#func _on_hitbox_body_entered(inimigo):
	#print("encostou")
	#print(inimigo.get_name())
	
	#if inimigo.get_name() == "frecha":
		#vida = vida-1
		#inimigo.queue_free()
	#if inimigo.get_name() == "INIMIGO":
		#vida = vida-2
		#inimigovida = inimigovida-3
	#if vida <= 0:
		#vida = 0
		
	
		
	#print(vida)
	#if vida == 0:
		#queue_free()
	#if inimigovida == 0:
		#inimigo.queue_free()
	#pass 
	
	
"vida atual"
func _receberdano(ataque):
	global.vida = global.vida-ataque
	emit_signal("atualizar_vida", global.vida)
	if global.vida <= 0:
		global.vida = 0
	if global.vida == 0:
		queue_free()
	
	pass




