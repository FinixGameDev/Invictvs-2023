extends Node

signal reset()
signal start(dictionary)
signal progress(value)
signal lost()
signal win()
signal meter_changed(value)

var solution = {}
var current = 0
var meter = 0
var combo = 0
var lives = 13

@export var meter_decrease = 10
@export var combo_multiplier = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	_init_Solution()
	$Timer.start()

func _process(delta):
	for i in range(0, 13):
		if Input.is_action_just_pressed(str(i)):
			if solution[str(i)] > current + 1:
				_reset()
			else: if solution[str(i)] == current + 1:
				_progress(i)
	
	meter = clamp(meter - meter_decrease * delta, 0, 100)
	emit_signal("meter_changed", meter)
	$Label.text = str(int($Timer.time_left * (13 / $Timer.wait_time)))
	if (current > 13):
		$Timer.stop()
		emit_signal("win")
		set_process(false)
		
	if Input.is_action_pressed("1") && (Input.is_action_pressed("3") &&
	Input.is_action_pressed("play")):
		$Timer.stop()

func _physics_process(delta):
	pass
	

func _on_Timer_timeout():
	emit_signal("lost")
	set_process(false)

func _reset():
	current = 0
	combo = 0
	lives -= 1
	$Lives.text = str(lives)
	emit_signal("reset")
	
	if (lives <= 0):
		emit_signal("lost")

func _progress(value_pressed):
	emit_signal("progress", value_pressed)
	current += 1
	combo += 1
	meter += 0.5 * combo * combo_multiplier

func _init_Solution():
	var values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
	
	for i in 13:
		var index = randi() % (13 - i)
		solution[str(i)] = values[index]
		values.remove_at(index)
		
	emit_signal("start", solution)
