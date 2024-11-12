extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var estado = 0
func _on_pressed():
	if estado == 0:
		var msg = get_node("/root/Fase_1/player/Msg-dona")
		msg.position.x = 300
		msg.position.y = -100
		estado = 1
		var botao = get_node("/root/Fase_1/player/Button")
		botao.text = "X"
		if JOGADOR.missao_lixo == 2:
			var check1 = get_node("/root/Fase_1/player/Check1")
			check1.position.y = check1.position.y + 600
		if JOGADOR.missao_pote == 1:
			var check1 = get_node("/root/Fase_1/player/Check2")
			check1.position.y = check1.position.y + 600
		if JOGADOR.missao_ar == 1:
			var check1 = get_node("/root/Fase_1/player/Check3")
			check1.position.y = check1.position.y + 600
	else: 
		var msg = get_node("/root/Fase_1/player/Msg-dona")
		msg.position.x = 300
		msg.position.y = -600
		estado = 0
		var botao = get_node("/root/Fase_1/player/Button")
		botao.text = "Aviso Dona"
		if JOGADOR.missao_lixo == 2:
			var check1 = get_node("/root/Fase_1/player/Check1")
			check1.position.y = check1.position.y - 600
		if JOGADOR.missao_pote == 1:
			var check1 = get_node("/root/Fase_1/player/Check2")
			check1.position.y = check1.position.y - 600
		if JOGADOR.missao_ar == 1:
			var check1 = get_node("/root/Fase_1/player/Check3")
			check1.position.y = check1.position.y - 600

