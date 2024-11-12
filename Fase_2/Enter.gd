extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var senha = get_parent().get_node("/root/Fase_2/player/Cadeado_eletronico/senha")
	if senha.text == "223231":
		var cadeado = get_parent().get_node("/root/Fase_2/player/Cadeado_eletronico")
		cadeado.visible = false
		var aviso = get_node("/root/Fase_2/player/aviso")
		aviso.aviso("Porta liberada!")
		var porta2 = get_node("/root/Fase_2/Porta2")
		porta2.position.y = 10
		print("porta liberada")
		var arteiro = get_node("/root/Fase_2/Warning")
		await get_tree().create_timer(5).timeout
		arteiro.position.y = 800
	pass # Replace with function body.
