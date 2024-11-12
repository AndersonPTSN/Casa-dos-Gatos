extends ItemList

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_item_clicked(index, _at_position, _mouse_button_index):
	print("CLIQUEI")
	var nome_item = self.get_item_text(index)
	var image_item = self.get_item_icon(index)
	var descricao_item = self.get_item_metadata(index)
	print("ITEM: ",nome_item)
	print("Descrição: ",descricao_item["description"])
	
	var janela = get_node("/root/Fase_2/Window")
	janela.title = nome_item
	janela.position.x = 300
	janela.position.y = 80
	var label = janela.get_node("Label")
	label.text = descricao_item["description"]
	var sprite = janela.get_node("Sprite2D")
	sprite.texture = image_item 
