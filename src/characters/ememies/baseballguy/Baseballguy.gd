extends Node2D

func play_walk():
	$Actions.play("walk")

func play_hurt():
	$Actions.play("hurt")
	$Actions.queue("walk")
