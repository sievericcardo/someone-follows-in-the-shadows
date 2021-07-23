extends Area2D

func _on_HeroesDetectZone_body_exited(_body):
	print("Out of sight?")
#	get_tree().change_scene("res://Screens/GameOver.tscn")


func _on_HeroesDetectZone_area_exited(_area):
	print("Out of area")
#	get_tree().change_scene("res://Screens/GameOver.tscn")
