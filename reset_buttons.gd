extends TextureRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(0,13):
			var event = InputEventAction.new()
			event.action = str(i)
			event.pressed = false
			Input.parse_input_event(event)
