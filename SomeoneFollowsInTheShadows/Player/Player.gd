extends KinematicBody2D

const MAX_SPEED = 80
const ACCEL = 500
const FRICTION = 500

var velocity = Vector2.ZERO

# This is equals to assign our animation player inside the _ready function
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree

# We store the state machine for the various position of our playback
onready var animationState = animationTree.get("parameters/playback")
	
# Using delta might lead to some lagging in some situation; it should not be
# a problem for a small project like this, but it need to be taken in care
func _physics_process(delta):
	_horizontal_movement(delta)
	_vertical_movement(delta)
	
func _horizontal_movement(delta):
	# Vector for the movement and movement speed
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# We normalize our vector, i.e. we set our vector to be "included in a circle"
	# and we do this so that the speed will not be significantly higher on the
	# diagonal
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	# Velocity will be dependent by our frame rate but we don't need the delta
	# since the move_and_slide will take care of that, and the linear_velocty
	# returned is updated into our velocity
	velocity = move_and_slide(velocity)
	
func _vertical_movement(_delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("res://Screens/Gimmic.tscn")
	

func _on_Hurtbox_area_entered(_area):
#	print(area)
	# If we are hit it's game over
	pass # Replace with function body.


func _on_Hurtbox_area_exited(_area):
	pass
#	get_tree().change_scene("res://Screens/GameOver.tscn")
