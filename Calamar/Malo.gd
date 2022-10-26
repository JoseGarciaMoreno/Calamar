extends RigidBody2D

func _ready():
	$AnimatedSprite.playing = true
	pass # Replace with function body.
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
