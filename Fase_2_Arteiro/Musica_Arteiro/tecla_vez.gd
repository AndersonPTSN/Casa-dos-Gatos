extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var speed = 200  # Velocidade de queda
var nome = ""

func _process(delta):
	position.y += delta * (speed + JOGADOR.nivel*JOGADOR.nivel*JOGADOR.nivel)
	if position.y > get_viewport_rect().size.y:
		queue_free() 

func nota_da_vez():
	var random_number = int(randf_range(1, 5))
	self.get_node("CollisionShape2D").scale = Vector2(2.8, 2.8)
	if random_number == 1:
		nome = "Esquerda"
		self.position.x = 97
		self.position.y = -40
		self.get_node("Sprite2D").texture = load("res://Fase_1_Dengozo/Musica_Dengozo/esquerda.png")
		self.get_node("Sprite2D").scale = Vector2(2, 2)
	if random_number == 2:
		nome = "Cima"
		self.position.x = 172
		self.position.y = -40
		self.get_node("Sprite2D").texture = load("res://Fase_1_Dengozo/Musica_Dengozo/cima.png")
		self.get_node("Sprite2D").scale = Vector2(2, 2)
	if random_number == 3:
		nome = "Baixo"
		self.position.x = 250
		self.position.y = -40
		self.get_node("Sprite2D").texture = load("res://Fase_1_Dengozo/Musica_Dengozo/baixo.png")
		self.get_node("Sprite2D").scale = Vector2(2, 2)
	if random_number == 4:
		nome = "Direita"
		self.position.x = 333
		self.position.y = -40
		self.get_node("Sprite2D").texture = load("res://Fase_1_Dengozo/Musica_Dengozo/direita.png")
		self.get_node("Sprite2D").scale = Vector2(2, 2)
