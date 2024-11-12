extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var dentro = 0
func _on_body_entered(body):
	var lixeira = get_node("/root/Fase_2/senha")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = "223231"
		sprite.scale.y = 1
		dentro = 1


func _on_body_exited(body):
	var lixeira = get_node("/root/Fase_2/senha")
	var label = lixeira.get_node("Label")
	var sprite = lixeira.get_node("Sprite2D")
	if body.name == "player":
		label.text = " "
		sprite.scale.y = 0
		dentro = 0


