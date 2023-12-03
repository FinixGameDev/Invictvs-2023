extends Node

var game_panel = preload("res://game_panel.tscn")

var active_game_panel
var scene_to_load

var level = 1
var score = 0

@onready var is_playing = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$WinTexture.visible = false
	
func _process(delta):
	if is_playing == false && Input.is_action_just_pressed("play"):
		start_game()

func start_game():
	if get_node("Credits") != null:
		get_node("Credits").queue_free()
		
	is_playing = true
	
	$AudioStreamPlayer2D.stop()
	
	$TextureRect.visible = false
	$PlayGame2.visible = false
	$WinTexture.visible = false
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
	
	$TextureRect.visible = true
	$PlayGame2.visible = true
	$AudioStreamPlayer2D.play()

func _on_win():
	end_game()
	
	level += 1
	if level > 15:
		level = 1
		score = 0
		$PlayGame.visible = false
		var credits = preload("res://credits.tscn").instantiate()
		add_child(credits)
	else:
		if level != 3 && level != 12:
			$WinTexture.texture = load("res://art/Next_level/next_level_"+ str(level - 1)+ ".png")
			$WinTexture.visible = true
		else:
			start_game()



func _on_play_game_pressed():
	start_game()
