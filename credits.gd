extends Control


func _on_animation_player_animation_finished(anim_name):
	get_parent().get_node("PlayGame2").visible = true
	get_parent().get_node("TextureRect").visible = true
	get_parent().get_node("AudioStreamPlayer2D").play()
	
	self.queue_free()
