class_name Level extends Node2D

@onready var sway = $Hand.sway
@export var handanim  = "4-mao"

signal progress

func _on_progress(value):
	$Hand/AnimationPlayer.play(handanim)
	$Hand.sway -= sway / 13
	emit_signal("progress")
