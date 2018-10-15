extends KinematicBody2D
signal player_vivo
# Variáveis
onready var player = get_node("../Player")
var distance = Vector2()
var timer = null
var spawn = true
var direction = Vector2()
var nion = preload("res://Inimigos/Summoner e Minion/Min-nion.tscn")
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1.9)
	timer.connect("timeout",self,"on_timeout_complete")
	add_child(timer)
func _on_timeout_complete():
	spawn = true
func _on_Player_vivo():
	emit signal("player_vivo")
	distance = player.position - position
	direction = (player.position - position).normalized()
	if ((distance.x > -196) and (distance.x < 196) and spawn == true):
		var minion = nion.instance()
		$"..".add_child(minion)
		spawn = false
	pass # replace with function body
func _physics_process(delta):
	position.y = +10
