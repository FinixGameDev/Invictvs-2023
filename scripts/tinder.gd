class_name tinder extends Sprite2D


func switch():
	self.texture = load("res://art/imagens finais/6-tinder" + str(randi() % 5 + 1) + ".png")
