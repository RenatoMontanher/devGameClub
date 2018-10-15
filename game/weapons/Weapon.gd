extends Area2D

signal attack_finished

onready var animation_player = $AnimationPlayer

enum STATES {IDLE, ATTACK}
var current_state = IDLE

export(int) var ataque = 3



func _ready():
	set_physics_process(false)
	animation_player.play("invisivel")


func _on_Player_ataque():
	_change_state(ATTACK)
	
	pass


func _change_state(new_state):
	current_state = new_state
	match current_state:
		IDLE:
			set_physics_process(false)
		ATTACK:
			set_physics_process(true)
			animation_player.play("attack")


func _on_Sword_body_entered(body):
	if body.is_in_group("inimigos"):
		print ("b")
		body._receberdano(ataque)
		set_physics_process(false)
	pass 






func _on_AnimationPlayer_animation_finished(name):
	if name == "ATTACK":
		_change_state(IDLE)
		animation_player.play("invisivel")
		emit_signal("attack_finished")
	pass # replace with function body




