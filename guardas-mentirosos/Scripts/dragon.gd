extends Control

var requiredPower = 30

func _ready() -> void:
	$RestartButton.hide()
	$MenuButton.show()
	
	var totalPower = GameManager.playerData.totalPower
	
	print("PODER FINAL: ", totalPower)
	print("PODER NECESSÁRIO: ", requiredPower)
	
	if totalPower >= requiredPower:
		show_victory(totalPower)
	else:
		show_defeat(totalPower)


func show_victory(totalPower: int) -> void:
	$ResultPanel/ResultTitle.text = "VITÓRIA!"
	$ResultPanel/ResultDescription.text = "Você derrotou o dragão!\n\nPoder final: " + str(totalPower)


func show_defeat(totalPower: int) -> void:
	$ResultPanel/ResultTitle.text = "DERROTA!"
	$ResultPanel/ResultDescription.text = "O dragão foi forte demais...\n\nPoder final: " + str(totalPower)
	
	$RestartButton.show()

func _on_restart_button_pressed() -> void:
	GameManager.currentRoom = 1
	GameManager.playerData = PlayerData.new()
	GameManager.load_next_room()

func _on_menu_button_pressed() -> void:
	pass # Replace with function body.
