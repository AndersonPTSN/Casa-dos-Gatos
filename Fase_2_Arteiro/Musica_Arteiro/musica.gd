extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_garrinhas()
	fim_da_fase()
	pass # Replace with function body.


func fim_da_fase():
	await get_tree().create_timer(25).timeout 
	var ceta = get_node("/root/musica/Ceta")
	if ceta.rotation > 0.5:
		JOGADOR.termometro = JOGADOR.termometro + 1
		JOGADOR.nivel + 3
	get_tree().change_scene_to_file("res://Fase_2_Arteiro/Arteiro.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	pass
	
	
var my_scene = preload("res://Fase_2_Arteiro/Musica_Arteiro/tecla_vez.tscn")
var num_garrinhas = 10
var spawn_interval = 2.0

func spawn_garrinhas():
	for i in range(num_garrinhas -1):
		await get_tree().create_timer(spawn_interval).timeout
		var garrinha_instance = my_scene.instantiate()
		garrinha_instance.nota_da_vez()
		add_child(garrinha_instance)

var plus =  - 0.36
var minus =   0.36
func get_input():
	var ceta = get_node("/root/musica/Ceta")
	if Input.is_action_just_pressed("ui_left"):
		if JOGADOR.é_dentro == 1 and JOGADOR.ceta == "Esquerda":
			JOGADOR.é_dentro = 0
			if ceta.rotation < 1.6:
				ceta.rotation = ceta.rotation + minus
		else:
			if ceta.rotation > -1.4:
				ceta.rotation = ceta.rotation + plus
				
	if Input.is_action_just_pressed("ui_up"):
		if JOGADOR.é_dentro == 1 and JOGADOR.ceta == "Cima":
			JOGADOR.é_dentro = 0
			if ceta.rotation < 1.6:
				ceta.rotation = ceta.rotation + minus
		else:
			if ceta.rotation > -1.4:
				ceta.rotation = ceta.rotation + plus

	if Input.is_action_just_pressed("ui_down"):
		if JOGADOR.é_dentro == 1 and JOGADOR.ceta == "Baixo":
			JOGADOR.é_dentro = 0
			if ceta.rotation < 1.6:
				ceta.rotation = ceta.rotation + minus
		else:
			if ceta.rotation > -1.4:
				ceta.rotation = ceta.rotation + plus

	if Input.is_action_just_pressed("ui_right"):
		if JOGADOR.é_dentro == 1 and JOGADOR.ceta == "Direita":
			JOGADOR.é_dentro = 0
			if ceta.rotation < 1.6:
				ceta.rotation = ceta.rotation + minus
		else:
			if ceta.rotation > -1.4:
				ceta.rotation = ceta.rotation + plus

