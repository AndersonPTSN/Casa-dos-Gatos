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
	var lixeira = get_node("/root/Fase_2/Porta")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = "Porta (F)"
		sprite.scale.y = 1
		dentro = 1

func remove_item_by_name(item_name):
	var lista = get_node("/root/Fase_2/player/ItemList")
	var item_count = lista.get_item_count()  # Número total de itens na lista

	for i in range(item_count):
		if lista.get_item_text(i) == item_name:  # Comparando o nome do item
			lista.remove_item(i)  # Remove o item pelo índice
			break  # Sai do loop após remover o item

	
func acao():	
	var player = get_node("/root/Fase_2/player")
	var list = get_node("/root/Fase_2/player/ItemList")
	var aviso = get_node("/root/Fase_2/player/aviso")
	if Input.is_key_pressed(KEY_F) and dentro == 1:
		dentro = 0
		if player.inventory.has("chave"):
			aviso.aviso("Porta liberada!")
			player.inventory.erase("chave")
			remove_item_by_name("chave")
			JOGADOR.chave = 1
			var porta2 = get_node("/root/Fase_2/Porta2")
			await get_tree().create_timer(1).timeout
			porta2.position.y = 630
			queue_free()


		if JOGADOR.chave == 0:
			aviso.aviso("Ache a chave para abrir a porta")
			

func _on_body_exited(body):
	var lixeira = get_node("/root/Fase_2/Porta")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = " "
		sprite.scale.y = 0
		dentro = 0


