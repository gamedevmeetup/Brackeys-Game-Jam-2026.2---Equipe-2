extends Node

var playerData = PlayerData.new()
var currentRoom = 1

var rooms: Array[RoomData] = []

func _ready() -> void:
	rooms = [
		preload("res://Data/Rooms/room_01.tres"),
		preload("res://Data/Rooms/room_02.tres"),
		preload("res://Data/Rooms/room_03.tres")
	]

func add_equipment(equipment: EquipmentData) -> void:
	playerData.currentEquipment = equipment
	playerData.totalPower += equipment.power

func go_to_next_room() -> void:
	currentRoom += 1

func load_next_room() -> void:
	if currentRoom <= rooms.size():
		get_tree().change_scene_to_file("res://Scenes/Room.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/Dragon.tscn")
