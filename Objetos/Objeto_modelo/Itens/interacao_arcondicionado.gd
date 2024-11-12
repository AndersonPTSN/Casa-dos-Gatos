extends Area2D

@onready var animation := $AnimatedSprite2D
func _ready():
	animation.play("default")
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	acao()
	pass

var dentro = 0
func _on_body_entered(body):
	var lixeira = get_node("/root/Fase_1/interacao_arcondicionado")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = "Ar-condicionado (F)"
		sprite.scale.y = 1
		dentro = 1

var control = 0
			
func acao():	
	var player = get_node("/root/Fase_1/player")
	var list = get_node("/root/Fase_1/player/ItemList")
	var aviso = get_node("/root/Fase_1/player/aviso")
	var ar = get_node("/root/Fase_1/interacao_arcondicionado/AnimatedSprite2D")

	if Input.is_key_pressed(KEY_F) and dentro == 1:
		dentro = 0
		if player.inventory.has("Controle") and control == 0:
			aviso.aviso("Temperatura aumentada!")
			ar.speed_scale = 1 
			control = control + 1
			JOGADOR.missao_ar = 1
			var gato = get_node("/root/Fase_1/Warning")
			if JOGADOR.missao_lixo == 2 and JOGADOR.missao_ar == 1 and JOGADOR.missao_pote == 1:
				gato.position.y = 630

		else:
			if control == 0:
				aviso.aviso("Meu Deus que frio!!!")
			else:
				aviso.aviso("Temperatura já esta ideal")

func _on_body_exited(body):
	var lixeira = get_node("/root/Fase_1/interacao_arcondicionado")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = " "
		sprite.scale.y = 0
		dentro = 0
