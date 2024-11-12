extends Node2D


func _ready():
	var my_scene = preload("res://Fase_1_Dengozo/Esquivar_Dengozo/garrinha.tscn")
	var instance = my_scene.instantiate() 
	add_child(instance) 
	spawn_garrinhas()
	fim_da_fase()
	vidas(0)

var my_scene = preload("res://Fase_1_Dengozo/Esquivar_Dengozo/garrinha.tscn")
var num_garrinhas = 10
var spawn_interval = 2.0
var garrinha_speed = 5 *  JOGADOR.nivel

func spawn_garrinhas():
	var player = get_node("/root/Esquivar/mao")
	for i in range(num_garrinhas -1):
		await get_tree().create_timer(spawn_interval).timeout
		var garrinha_instance = my_scene.instantiate()
		garrinha_instance.position = Vector2(get_viewport().size.x / 2, 0)
		var direction = (player.position - garrinha_instance.position).normalized()
		garrinha_instance.rotation = 90 + direction.angle()
		garrinha_instance.speed = garrinha_speed
		add_child(garrinha_instance)

func vidas(v):
	var vidas = get_node("/root/Esquivar/vida")
	vidas.text = "Vidas: "+str(JOGADOR.vidas)

func fim_da_fase():
	await get_tree().create_timer(20).timeout
	print("terminou") 
	if JOGADOR.vidas >= 0:
		JOGADOR.termometro = JOGADOR.termometro + 1
		JOGADOR.nivel + 3
	get_tree().change_scene_to_file("res://Fase_1_Dengozo/Dengozo.tscn")
