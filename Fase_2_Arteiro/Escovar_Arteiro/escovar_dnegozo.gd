extends Node2D

var coin_scene = preload("res://Fase_2_Arteiro/Escovar_Arteiro/pelo.tscn")  # Caminho para a cena da moeda
var spawn_x_position = 1200  # Posição X onde as moedas aparecerão (à direita da tela)
var spawn_area_y = Vector2(50, 400)  # Faixa de valores Y para spawn
var spawn_interval = 1.0  # Intervalo de tempo entre spawns
var timer = Timer.new()
var num_coins = 10  # Número total de moedas a serem geradas
var coins_spawned = 0  # Contador de moedas já geradas


func _ready():
	randomize()  # Inicializa o gerador de números aleatórios
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	spawn_coin()
	fim_da_fase()

func spawn_coin():
	if coins_spawned < num_coins:
		var coin_instance = coin_scene.instantiate()  # Instancia a moeda
		var random_y_position = randf_range(spawn_area_y.x, spawn_area_y.y)  # Gera posição Y aleatória dentro do intervalo
		coin_instance.position = Vector2(spawn_x_position, random_y_position)
		add_child(coin_instance)  # Adiciona a moeda à cena

		coins_spawned += 1  # Incrementa o contador de moedas geradas

		# Define um intervalo de tempo aleatório para o próximo spawn (entre 0.5 e 2 segundos)
		timer.wait_time = randf_range(0.5, 2.0)
		timer.start()

func _on_Timer_timeout():
	spawn_coin()


func _on_parede_body_entered(body):
	var img = get_node("/root/Escovar_Dnegozo/Menos1")
	img.position.y =  250
	img.position.x =  100
	for i in range(30):
		await get_tree().create_timer(0.01).timeout
		img.position.y = img.position.y - 10

func fim_da_fase():
	await get_tree().create_timer(20).timeout
	print("terminou") 
	if JOGADOR.pontuação >= 5:
		JOGADOR.termometro = JOGADOR.termometro + 1
	get_tree().change_scene_to_file("res://Fase_2_Arteiro/Arteiro.tscn")
