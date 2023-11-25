extends Sprite2D

var sway = 500
@onready var origin = position

@onready var randx = randf() * -0.5
@onready var randy = randf() * -0.5

func _process(delta):
	position = Vector2( lerp(position.x, origin.x + sway * randx, delta * 4.5),
						lerp(position.y, origin.y + sway * randy, delta * 4.5), )
	


func _on_timer_timeout():
	randx = randf() * -.5
	randy = randf() * -.5
