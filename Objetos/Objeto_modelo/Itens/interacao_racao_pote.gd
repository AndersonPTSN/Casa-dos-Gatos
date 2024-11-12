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
	var lixeira = get_node("/root/Fase_1/interacao_racao_pote")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = "Ração (F)"
		sprite.scale.y = 1
		dentro = 1
		
var new_icon = preload("res://Objetos/Objeto_modelo/Itens/pote_com_racao.png")
func chenge_item_by_name(item_name):
	var lista = get_node("/root/Fase_1/player/ItemList")
	var item_count = lista.get_item_count()  # Número total de itens na lista

	for i in range(item_count):
		if lista.get_item_text(i) == item_name:  # Comparando o nome do item
			print(lista.get_item_text(i))
			lista.set_item_text(i, "Pote com ração")
			lista.set_item_icon(i, new_icon)
			chenge_item_by_name_of_player(item_name)
			break  # Sai do loop após remover o item
			
func chenge_item_by_name_of_player(item_name):
	var player = get_node("/root/Fase_1/player")
	for i in range(player.inventory.size()):
		if player.inventory[i] == item_name:  # Comparando o nome do item
			print(player.inventory[i])
			player.inventory[i] = "Pote com ração"
			break  # Sai do loop após remover o item
			
func acao():	
	var player = get_node("/root/Fase_1/player")
	var list = get_node("/root/Fase_1/player/ItemList")
	var aviso = get_node("/root/Fase_1/player/aviso")

	if Input.is_key_pressed(KEY_F) and dentro == 1:
		dentro = 0
		if player.inventory.has("Pote"):
			aviso.aviso("Pote com ração")
			chenge_item_by_name("Pote")

		else:
			aviso.aviso("Ração para gatos comer")

func _on_body_exited(body):
	var lixeira = get_node("/root/Fase_1/interacao_racao_pote")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = " "
		sprite.scale.y = 0
		dentro = 0


