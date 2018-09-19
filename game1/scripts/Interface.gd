extends Control


signal atualizar_vida(vida)


func _on_Player_atualizar_vida(vida):
	print ("recebeu sinal")
	emit_signal("atualizar_vida", vida)
	
	pass # replace with function body


func _on_Player_inicio(vida):
	print ("recebeu sinal")
	emit_signal("atualizar_vida", vida)
	pass # replace with function body
