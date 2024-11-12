extends CharacterBody2D  # Use CharacterBody2D ou KinematicBody2D

var speed = 200  # Velocidade da moeda

func _process(delta):
	translate(Vector2(-speed * delta * (JOGADOR.termometro+1), 0))  # Move a moeda para a esquerda

	if position.x < 0:
		queue_free()  # Remove a moeda se sair da tela

func _on_area_2d_body_entered(body):
	if body.name == "Pente":  # Verifica se o corpo que colidiu é o jogador
		JOGADOR.pontuação
		queue_free()  # Remove a moeda
		body.add_score(1)  # Exemplo: Adiciona um ponto ao jogador (se houver um método add_score no jogador)
