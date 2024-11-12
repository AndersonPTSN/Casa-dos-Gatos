extends Resource

class_name Objeto

@export var nome: String
@export var descricao: String
@export var imagem: String

func aplicar_imagem(nodo):
	var sprite = nodo.get_nome("Sprite2D")
	sprite.texture = imagem
