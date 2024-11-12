extends Area2D

func _ready():
	pass 

func _process(delta):
	pass
	
func _on_body_entered(body):
	JOGADOR.é_dentro = 1
	JOGADOR.ceta = "Cima"
	
func _on_body_exited(body):
	JOGADOR.é_dentro = 0
	JOGADOR.ceta = ""
