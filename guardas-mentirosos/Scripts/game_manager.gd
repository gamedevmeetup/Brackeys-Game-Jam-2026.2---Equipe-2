extends Node

var playerData = PlayerData.new()

func add_equipment(equipment: EquipmentData) -> void:
	playerData.currentEquipment = equipment
	playerData.totalPower += equipment.power
