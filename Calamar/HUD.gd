extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_game


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_message(text):
	$mesajes/Message.text = text
	$mesajes/Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$mesajes/Message.text = "El Juegazo del Calamar"
	$mesajes/Message.show()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	pass # Replace with function body.

func _on_HUD_start_game():
	print("empiezo")
	pass # Replace with function body.
