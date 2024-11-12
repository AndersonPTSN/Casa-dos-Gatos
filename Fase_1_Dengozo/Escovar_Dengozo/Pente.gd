extends CharacterBody2D

# Velocidade de movimento
var speed = 200
var velocidade = Vector2.ZERO

func _process(delta):
	velocidade = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		velocidade.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocidade.y = speed

	# Move o personagem e detecta colisões
	move_and_collide(velocidade * delta)

var score = 0

func add_score(ponto):
	aviso()
	JOGADOR.pontuação = JOGADOR.pontuação +1
	score = score + ponto
	
func aviso():
	var img = get_node("/root/Escovar_Dnegozo/Mais1")
	var pont = get_node("/root/Escovar_Dnegozo/Label3")
	
	if img and img.get_tree():  # Verifica se o nó img existe e está na árvore de cenas
		img.position.y = self.position.y + 100
		img.position.x = self.position.x + 100
		
		for i in range(30):
			var timer = Timer.new()
			add_child(timer)
			timer.wait_time = 0.01
			timer.one_shot = true
			timer.start()
			await timer.timeout
			img.position.y -= 10
			timer.queue_free()  # Libera o timer após o uso
		
		# Atualiza o texto da pontuação
		pont.text = "Pontuação: " + str(score)
	else:
		print("O nó img não está na árvore de cenas ou é nulo.")

