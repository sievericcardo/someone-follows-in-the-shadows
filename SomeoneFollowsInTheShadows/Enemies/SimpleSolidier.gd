extends KinematicBody2D

# This is equals to assign our animation player inside the _ready function
onready var animationPlayer = $SoldierAnimation
onready var animationTree = $SoldierAnimationTree
onready var playerDetectionZone = $PlayerDetectionZone

# We store the state machine for the various position of our playback
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(_delta):
	var vector = get_position()
	
	vector = vector.normalized()
	
	animationTree.set("parameters/Run/blend_position", vector)
	animationState.travel("Run")

func _on_HeroesPathFollow2D_no_shield():
	playerDetectionZone.cleanup()
