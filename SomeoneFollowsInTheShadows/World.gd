extends Node2D

onready var animationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("FirstDialog")

# If the enemy reach the point they can be approached
func _on_HeroesPathFollow2D_no_shield():
	animationPlayer.play("SecondDialog")

# If the enemy can't be seen it's over
func _on_VisibilityNotifier2D_screen_exited():
	get_tree().change_scene("res://Screens/GameOver.tscn")
