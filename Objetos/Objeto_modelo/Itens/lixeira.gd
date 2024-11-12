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
	var lixeira = get_node("/root/Fase_1/interacao_lixeira")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = "Lixeira (F)"
		sprite.scale.y = 1
		dentro = 1

func remove_item_by_name(item_name):
	var lista = get_node("/root/Fase_1/player/ItemList")
	var item_count = lista.get_item_count()  # Número total de itens na lista

	for i in range(item_count):
		if lista.get_item_text(i) == item_name:  # Comparando o nome do item
			lista.remove_item(i)  # Remove o item pelo índice
			break  # Sai do loop após remover o item

	
func acao():	
	var player = get_node("/root/Fase_1/player")
	var list = get_node("/root/Fase_1/player/ItemList")
	var aviso = get_node("/root/Fase_1/player/aviso")
	if Input.is_key_pressed(KEY_F) and dentro == 1:
		#print("usou item")
		dentro = 0
		if player.inventory.has("Lixo"):
			aviso.aviso("Lixo jogado na lixeira")
			#print("Uma Planta foi usada")
			player.inventory.erase("Lixo")
			remove_item_by_name("Lixo")
			JOGADOR.missao_lixo = JOGADOR.missao_lixo + 1
			var gato = get_node("/root/Fase_1/Warning")
			if JOGADOR.missao_lixo == 2 and JOGADOR.missao_ar == 1 and JOGADOR.missao_pote == 1:
				gato.position.y = 630

		else:
			aviso.aviso("Uma lixeira comum")
			#print("Esta vazio, coloque uma Planta")

func _on_body_exited(body):
	var lixeira = get_node("/root/Fase_1/interacao_lixeira")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = " "
		sprite.scale.y = 0
		dentro = 0


