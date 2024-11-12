extends Sprite2D

@export var background_speed: float = 30.0
@export var screen_width: float = 1024.0
@export var background_width: float = 2048.0

func _process(delta):
	var bg1 = get_node("/root/Fase_1/Menu/background")  # Primeiro background
	var bg2 = get_node("/root/Fase_1/Menu/background2")  # Segundo background

	# Mover os backgrounds
	bg1.position.x -= background_speed * delta
	bg2.position.x -= background_speed * delta

	# Verificar se o bg1 saiu da tela e reposicionar
	if bg1.position.x <= -background_width:
		bg1.position.x = bg2.position.x + background_width

	# Verificar se o bg2 saiu da tela e reposicionar
	if bg2.position.x <= -background_width:
		bg2.position.x = bg1.position.x + background_width
