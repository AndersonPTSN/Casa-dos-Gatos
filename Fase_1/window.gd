extends Window


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_requested():
	var janela = get_node("/root/Fase_1/Window")
	janela.position.x = 9000
	janela.position.y = 9000
