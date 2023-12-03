extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$TextureProgressBar.texture_progress.color = Color.WHITE


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_minigame_progress(value):
	print("ColorRect" + str(value))
	get_node("TextureRect/ColorRect" + str(value)).color = Color.GREEN





func _on_minigame_reset():
	for i in 13:
		get_node("TextureRect/ColorRect" + str(i)).color = Color.RED
	$Timer.start()



func _on_Timer_timeout():
	for i in 13:
		get_node("TextureRect/ColorRect" + str(i)).color = Color.WHITE


func _on_Minigame_win():
	#$TextureProgressBar.texture_progress.color = Color.GREEN
	pass


func _on_Minigame_lost():
	#$TextureProgressBar.texture_progress.color = Color.RED
	pass


func _on_minigame_meter_changed(value):
	pass


func _on_minigame_start(dictionary):
	for i in 13:
		get_node("TextureRect/ColorRect" + str(i)).get_child(0).text = str(dictionary[str(i)])
