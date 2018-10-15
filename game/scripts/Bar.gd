extends HBoxContainer

# class member variables go here, for example:
# var a = 2
var vida_atual = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Interface_atualizar_vida(vida):
	animate_value(vida_atual,vida)
	vida_atual = vida
	$TextureProgress.value = vida
	pass # replace with function body


func animate_value(start,end):
	$Tween.interpolate_property($TextureProgress, "value", start, end, 0.3, Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	$Tween.start()