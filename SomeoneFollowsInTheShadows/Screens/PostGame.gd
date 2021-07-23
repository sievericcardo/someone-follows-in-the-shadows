extends Control

const scene_path_to_load = "res://Screens/TitleScreen.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$ButtonBg/BackButton.grab_focus()
	
	for button in $ButtonBg.get_children():
		button.connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	get_tree().change_scene(scene_path_to_load)

