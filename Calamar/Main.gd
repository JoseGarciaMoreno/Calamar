extends Node2D

export(PackedScene) var Malos_scene
var score : int

func _ready():
	randomize()
	
func game_over():
	$PuntoTimer.stop()
	$MalosTimer.stop()
	
func new_game():
	get_tree().call_group("Gmalos", "queue_free")
	score = 0
	$Njugador.start($StartPosition.position)
	print("acho empiezo",score)
	$PuntoTimer.start()
	$HUD/mesajes/Puntuacion.text = str(score)
	$HUD.show_message("Get Ready")
	
func _on_PuntoTimer_timeout():
	score += 1
	$HUD/mesajes/Puntuacion.text = str(score)
	
func _on_EspeTimer_timeout():
	$MalosTimer.start()
	$PuntoTimer.start()
	$HUD/mesajes/Message.hide()
	$EspeTimer.start()
	
func _on_MalosTimer_timeout():
	var malo = Malos_scene.instance()
	var malo_spawn_location = get_node("MaloPath2D/MaloPathFollow2D")
	malo_spawn_location.offset = randi()
	var direction = malo_spawn_location.rotation + PI / 2
	malo.position = malo_spawn_location.position
	direction += rand_range(-PI / 4, PI / 4)
	malo.rotation = direction
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	malo.linear_velocity = velocity.rotated(direction)
	add_child(malo)
	
func _on_HUD_start_game():
	print("empiezo bien")
	new_game()
	
func _on_Njugador_golpe():
	$HUD.show_game_over()
	print("poner game over")
	
