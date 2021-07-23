extends Area2D

var danger = 1

func cleanup():
	danger = 0

func _on_PlayerDetectionZone_body_entered(_body):
	if danger == 1:
		print("In the danger zone")
		get_tree().change_scene("res://Screens/GameOver.tscn")
	else:
		get_tree().change_scene("res://Screens/Victory.tscn")
