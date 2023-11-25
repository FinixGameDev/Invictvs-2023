class_name Game extends Node


#@onready var _pause_menu := $InterfaceLayer/PauseMenu as PauseMenu

var client: WebSocketClient = null

func get_action_from_key(key: String):
	if key == "play":
		print("Play")
		return "play"
	if key == "service":
		print("Play2")
		return "0"
	if key == "pay":
		return "1"
	if key == "help":
		return "2"
	if key == "bet_1":
		return "3"
	if key == "play_8":
		return "4"
	if key == "bet_2":
		return "5"
	if key == "play_18":
		return "6"
	if key == "bet_3":
		return "7"
	if key == "play_38":
		return "8"
	if key == "bet_6":
		return "9"
	if key == "play_68":
		return "10"
	if key == "bet_10":
		return "11"
	if key == "play_88":
		return "12"
	return null

func _ready() -> void:
	print("ready ma friend")

	client = WebSocketClient.new()

	var status = client.connect_to_url("ws://localhost:3333")

	if (status != OK):
		return print("Failed to connect to service. Not retrying...")

	var on_message = func(message):
		print(message)

		var json = JSON.new()
		var parsed = json.parse_string(message)

		if not parsed:
			print("Failed to parse message")
			return

		if parsed.id != "service::hardware/inputs/status_change":
			return

		var key = parsed.payload.data.name
		var state = parsed.payload.data.input_state == "active"
		var action = get_action_from_key(key)

		var event = InputEventAction.new()
		event.action = action
		event.pressed = state
		Input.parse_input_event(event)

	client.message_received.connect(on_message)

func _process(delta):
	if client:
		client._process(delta)

