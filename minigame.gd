extends Node

signal reset()
signal progress(value)
signal lost()
signal win()
signal meter_changed(value)

var solution = {}
var current = 0
var meter = 0
var combo = 0

export var meter_decrease = 10
export var combo_multiplier = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	_init_Solution()
	$Timer.start()

func _process(delta):
	meter = clamp(meter - meter_decrease * delta, 0, 100)
	emit_signal("meter_changed", meter)
	if (meter >= 100):
		emit_signal("win")
		set_process(false)

func _physics_process(delta):
	for i in range(0, 13):
		if Input.is_action_just_pressed(str(i)):
			if solution[str(i)] == current + 1:
				_progress()
			else:
				_reset()


func _on_Timer_timeout():
	emit_signal("lost")
	set_process(false)

func _reset():
	current = 0
	combo = 0
	print("reseted")
	emit_signal("reset")

func _progress():
	emit_signal("progress", current)
	current += 1
	combo += 1
	meter += 0.5 * combo * combo_multiplier
	print("Current: " + str(current))

func _init_Solution():
	var values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
	
	for i in 13:
		var index = randi() % (13 - i)
		solution[str(i)] = values[index]
		values.remove(index)
		
	print(str(solution))
