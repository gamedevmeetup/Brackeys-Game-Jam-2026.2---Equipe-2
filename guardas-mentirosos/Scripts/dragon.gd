extends Control

var requiredPower = 30

func _ready() -> void:
	var totalPower = GameManager.playerData.totalPower
	
	print("PODER FINAL: ", totalPower)
	print("PODER NECESSÁRIO: ", requiredPower)
