extends Area2D

@export var objeto: Objeto

var minha_textura2 = preload("res://Objetos/Objeto_modelo/Itens/pote.png")
#IMAGEM QUE APARECE PRIMEIRO POIS FOI CARREGADA

func _ready():
	var sprite = Sprite2D.new()
	sprite.texture = minha_textura2
	add_child(sprite)

func _on_body_entered(body):
	if body.name == "player":
		var aviso = get_node("/root/Fase_1/player/aviso")
		var texto = "Item coletado: " + objeto.nome #IMAGEM QUE APARECE DEPOIS POIS NÃO FOI CARREGADA
		aviso.aviso(texto)
		body.add_to_inventory(objeto.nome,objeto.imagem, objeto.descricao)
		queue_free()

