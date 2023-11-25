extends Node

var game_panel = preload("res://game_panel.tscn")

var active_game_panel
var scene_to_load

var level = 1
var score = 0

@onready var is_playing = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if is_playing == false && Input.is_action_just_pressed("play"):
		start_game()

func start_game():
	is_playing = true
	scene_to_load = load("res://levels/Level" + str(level) + ".tscn").instantiate()
	
	$PlayGame.visible = false
	active_game_panel = game_panel.instantiate()
	add_child(scene_to_load)
	add_child(active_game_panel)
	active_game_panel.get_child(0).lost.connect(_on_lost)
	active_game_panel.get_child(0).win.connect(_on_win)
	
	active_game_panel.get_child(0).connect("progress", scene_to_load._on_progress)

func end_game():
	is_playing = false
	scene_to_load.queue_free()
	active_game_panel.queue_free()
	$PlayGame.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_lost():
	end_game()
	level = 1
	score = 0

func _on_win():
	end_game()
	level += 1
	if level > 13:
		level = 1
		#print win screen

func _on_play_game_pressed():
	start_game()
