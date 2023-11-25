extends Sprite2D


@export var images = []

func switch():
	self.texture = images[randi() % images.count]
