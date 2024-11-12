extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	mudar_termometro(JOGADOR.termometro)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
		JOGADOR.menu = JOGADOR.menu + 1
		TheGame()
		
func Vitoria():
	if JOGADOR.termometro >= 7:
		var label = get_node("/root/Dengozo/Label")
		var button = get_node("/root/Dengozo/Button")
		button.position.x = -10000
		label.text = "Parabens! vc conseguiu conquistar o Arteiro!!!"
		await get_tree().create_timer(5).timeout
		JOGADOR.pontuação = 0
		JOGADOR.menu = 0
		JOGADOR.game = 1
		JOGADOR.termometro = 0
		JOGADOR.vidas = 5
		JOGADOR.nivel = 1

		JOGADOR.é_dentro = 0
		JOGADOR.ceta = ""

		get_tree().change_scene_to_file("res://Vitoria/Vitoria.tscn")

func TheGame():
	Vitoria()
	print(JOGADOR.game)
	print(JOGADOR.menu)
	if JOGADOR.menu < 7:
		var label = get_node("/root/Dengozo/Label")
		label.text = "Escove todo o pelo do Arteiro! (pegue as bolinhas de pelo)"
		JOGADOR.game = JOGADOR.game + 1
		Vitoria()
		if JOGADOR.menu%2 == 0:
			JOGADOR.pontuação = 0
			get_tree().change_scene_to_file("res://Fase_2_Arteiro/Escovar_Arteiro/escovar_dnegozo.tscn")
		
	if JOGADOR.menu >= 7 and JOGADOR.menu <= 12:
		var label = get_node("/root/Dengozo/Label")
		label.text = "Arteiro esta estressado, esquive das garras dele!"
		JOGADOR.game = JOGADOR.game + 1
		Vitoria()
		if JOGADOR.menu%2 == 0:
			JOGADOR.vidas = 5
			get_tree().change_scene_to_file("res://Fase_2_Arteiro/Esquivar_Arteiro/esquivar.tscn")
		
	if JOGADOR.menu > 12 and JOGADOR.menu < 19:
		var label = get_node("/root/Dengozo/Label")
		label.text = "Cante uma cansão para botar Arteiro pra dormir"
		JOGADOR.game = JOGADOR.game + 1
		Vitoria()
		if JOGADOR.menu%2 == 0:
			JOGADOR.nivel = JOGADOR.nivel + 1
			get_tree().change_scene_to_file("res://Fase_2_Arteiro/Musica_Arteiro/musica.tscn")
			
	if JOGADOR.menu >= 19:
		if get_tree():  # Certifique-se de que get_tree() não retorna null
			get_tree().change_scene_to_file("res://Bad_Ending/bad_end.tscn")
		else:
			print(JOGADOR.game)
			print("SEM SINAL")
		
func  mudar_termometro(valor):
	var t = get_node("/root/Dengozo/Termometro")
	var nova_textura = load("res://Fase_2_Arteiro/Termometros/termometro"+str(valor)+".png")
	t.texture = nova_textura
	
