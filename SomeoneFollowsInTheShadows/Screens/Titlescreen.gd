extends Control

var scene_path_to_load
var music_to_play

#const MenuSound = preload("res://Sounds/Menu_Select_1.ogg")

func _ready():
	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
	
	# In our case we'll only have one button, but we might add more
	for button in $Menu/CenterRow/Buttons.get_children():
		if not button.scene_to_load:
			continue
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
#		var sound = MenuSound.instance()
#		get_tree().current_scene.add_child(sound)
		
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
#	get_tree().change_scene(scene_path_to_load)

func _on_FadeIn_fade_in_finished():
	get_tree().change_scene(scene_path_to_load)
