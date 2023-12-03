extends Button

func _ready():
	pressed.connect(_activate_action)
	


func _activate_action():
	var action = get_parent().name.erase(0, 9)
	var event = InputEventAction.new()
	event.action = str(action)
	event.pressed = true
	Input.parse_input_event(event)
