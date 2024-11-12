extends CharacterBody2D

var input: Vector2 = Vector2.ZERO
var velocidade: float = 200.0
@onready var animation := $AnimatedSprite2D
var direção = 1

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if input.x != 0:
		if input.x > 0:
			direção = 3
		elif input.x < 0:
			direção = -3
		
		animation.play("rum")
		animation.scale.x = direção  # Ajusta a escala conforme a direção
	else:
		animation.play("idle")  # Mantém a animação em idle quando não há movimento
	
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	input = input.normalized()
	
func character_moviment():
	velocity = input * velocidade


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_input()
	character_moviment()
	move_and_slide()
	pass

var inventory = []
var teste = "teste"
var id = 0

func add_to_inventory(nome, imagem, descricao):
	var lista = get_node("/root/Fase_1/player/ItemList")
	if lista:
		inventory.append(nome)
		var pre_load = imagem
		var icon_texture = load(imagem)
		lista.add_item(nome, icon_texture, false)
		lista.set_item_metadata(id, {"description": descricao})
		id = id + 1
	else:
		print("item_list não encontrado. ",lista)



