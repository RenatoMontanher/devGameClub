extends Area2D
signal atualizar_vida
func _on_LifeHeart_body_entered(body):
	if body.is_in_group("Player"):
		global.vida = 30
		emit_signal("atualizar_vida", global.vida)
		queue_free()
	pass # replace with function body
