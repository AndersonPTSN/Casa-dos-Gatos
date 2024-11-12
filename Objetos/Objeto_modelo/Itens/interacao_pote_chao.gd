extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	acao()
	pass

var dentro = 0
func _on_body_entered(body):
	var lixeira = get_node("/root/Fase_1/interacao_pote_chao")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = "Comedouro (F)"
		sprite.scale.y = 1
		dentro = 1
		
var pote_sprite = preload("res://Objetos/Objeto_modelo/Itens/pote.png")
func chenge_item_by_name(item_name):
	var lista = get_node("/root/Fase_1/player/ItemList")
	var player = get_node("/root/Fase_1/player")
	var item_count = lista.get_item_count()  # Número total de itens na lista
	if item_name == "Pote":
		for i in range(item_count):
			if lista.get_item_text(i) == "Pote com água" or lista.get_item_text(i) == "Pote com ração":
				lista.set_item_text(i, "Pote")
				lista.set_item_icon(i, pote_sprite)
				for j in range(player.inventory.size()):
					if player.inventory[j] == "Pote com água" or player.inventory[j] == "Pote com ração":
						print(player.inventory[j])
						player.inventory[j] = "Pote"


			
func acao():	
	var player = get_node("/root/Fase_1/player")
	var list = get_node("/root/Fase_1/player/ItemList")
	var aviso = get_node("/root/Fase_1/player/aviso")
	var casa = get_node("/root/Fase_1/Casa/pote_chao")

	if Input.is_key_pressed(KEY_F) and dentro == 1:
		dentro = 0
		if player.inventory.has("Pote com água"):
			aviso.aviso("Comedouro agora com água!")
			if casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao.png" or casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao_agua.png":
				var nova_textura = load("res://Objetos/Objeto_modelo/Itens/pote_chao_agua.png")
				casa.texture = nova_textura
				chenge_item_by_name("Pote")
			else:
				var nova_textura = load("res://Objetos/Objeto_modelo/Itens/pote_chao_agua_racao.png")
				casa.texture = nova_textura
				chenge_item_by_name("Pote")
				JOGADOR.missao_pote = 1
				var gato = get_node("/root/Fase_1/Warning")
				if JOGADOR.missao_lixo == 2 and JOGADOR.missao_ar == 1 and JOGADOR.missao_pote == 1:
					gato.position.y = 630


		if player.inventory.has("Pote com ração"):
			aviso.aviso("Comedouro agora com ração!")
			if casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao.png" or casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao_racao.png":
				var nova_textura = load("res://Objetos/Objeto_modelo/Itens/pote_chao_racao.png")
				casa.texture = nova_textura
				chenge_item_by_name("Pote")
			else:
				var nova_textura = load("res://Objetos/Objeto_modelo/Itens/pote_chao_agua_racao.png")
				casa.texture = nova_textura
				chenge_item_by_name("Pote")
				JOGADOR.missao_pote = 1
				var gato = get_node("/root/Fase_1/Warning")
				if JOGADOR.missao_lixo == 2 and JOGADOR.missao_ar == 1 and JOGADOR.missao_pote == 1:
					gato.position.y = 630


		if casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao.png":
			aviso.aviso("Um comedouro sem água e ração")
		if casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao_racao.png":
			aviso.aviso("Um comedouro sem água e com ração")
		if casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao_agua.png":
			aviso.aviso("Um comedouro com água e sem ração")
		if casa.texture.resource_path == "res://Objetos/Objeto_modelo/Itens/pote_chao_agua_racao.png":
			aviso.aviso("Um comedouro com água e ração")


func _on_body_exited(body):
	var lixeira = get_node("/root/Fase_1/interacao_pote_chao")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = " "
		sprite.scale.y = 0
		dentro = 0


