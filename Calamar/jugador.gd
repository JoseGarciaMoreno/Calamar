extends Area2D

signal golpe
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.


func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_Njugador_golpe():
	
	print("hola que haces")
	pass # Replace with function body.

func _on_Njugador_body_entered(_body):
	print("hola que haces entrada")
	hide() # Player disappears after being hit.
	emit_signal("golpe")
 # Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	pass # Replace with function body.
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
