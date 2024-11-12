extends CharacterBody2D

var speed = 400
var velocidade = Vector2.ZERO

func _process(delta):
	velocidade = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		velocidade.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocidade.x = speed

	# Move o personagem e detecta colisões
	move_and_collide(velocidade * delta)
