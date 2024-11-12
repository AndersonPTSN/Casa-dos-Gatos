extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func aviso(texto):
	var label = self.get_node("Label")
	label.text = texto
	self.position.y = -200
	await get_tree().create_timer(2).timeout
	for i in range(25):
		await get_tree().create_timer(0.01).timeout
		self.position.y = self.position.y - 10
