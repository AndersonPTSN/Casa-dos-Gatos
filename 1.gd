extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var senha = get_parent().get_node("/root/Fase_2/player/Cadeado_eletronico/senha")
	senha.text = senha.text + "1"
	pass # Replace with function body.
