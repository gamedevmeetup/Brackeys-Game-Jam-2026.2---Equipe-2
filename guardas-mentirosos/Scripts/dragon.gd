extends Control

var requiredPower = 30

func _ready() -> void:
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
