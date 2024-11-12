extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(20).timeout
	JOGADOR.menu = 0
	JOGADOR.game = 1
	JOGADOR.termometro = 0
	JOGADOR.vidas = 5
	JOGADOR.nivel = 1
	get_tree().change_scene_to_file("res://Fase_1_Dengozo/Dengozo.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
