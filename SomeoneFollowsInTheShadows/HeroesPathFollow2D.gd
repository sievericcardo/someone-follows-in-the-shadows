extends PathFollow2D

export var runSpeed = 20
signal no_shield

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_offset(get_offset() + runSpeed * delta)
	
	if(loop == false and get_unit_offset() == 1):
		
		var timer = Timer.new()
		timer.set_wait_time( 30 )
		timer.connect("timeout", self, "_on_Timer_timeout")
		
		add_child(timer)
		timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("World.tscn")
