extends Control

func _on_door_left_door_confirmed(door) -> void:
	print("PORTA ESCOLHIDA: ", door.name)

func _on_door_right_door_confirmed(door) -> void:
	print("PORTA ESCOLHIDA: ", door.name)

func _on_guard_right_mouse_entered() -> void:
	$SpeechBubbleRight.show()

func _on_guard_right_mouse_exited() -> void:
	$SpeechBubbleRight.hide()

func _on_guard_left_mouse_entered() -> void:
	$SpeechBubbleLeft.show()

func _on_guard_left_mouse_exited() -> void:
	$SpeechBubbleLeft.hide()
