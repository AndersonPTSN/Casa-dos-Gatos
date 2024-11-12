extends CharacterBody2D


var direction = Vector2.ZERO
var speed = 5 * JOGADOR.nivel

func _ready():
	var player = get_node("/root/Esquivar/mao")
	direction = (player.position - position).normalized()

func _physics_process(delta):
	var velocit = direction * speed
	move_and_collide(velocit)

func _on_area_2d_body_entered(body):
	if body.name == "mao":
		JOGADOR.vidas = JOGADOR.vidas -1
		var esq = get_node("/root/Esquivar")
		esq.vidas(1)
		queue_free()
		

