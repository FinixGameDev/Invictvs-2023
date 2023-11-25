extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_minigame_progress(value):
	print("ColorRect" + str(value))
	get_node("ColorRect" + str(value)).color = Color.GREEN





func _on_minigame_reset():
	for i in 13:
		get_node("ColorRect" + str(i)).color = Color.RED
	$Timer.start()



func _on_Timer_timeout():
	for i in 13:
		get_node("ColorRect" + str(i)).color = Color.WHITE


func _on_Minigame_win():
	get_node("MarginContainer/ColorRect").color = Color.GREEN


func _on_Minigame_lost():
	get_node("MarginContainer/ColorRect").color = Color.RED
