extends Control

var correctDoor = "DoorLeft"
var truthGuard = "GuardLeft"

func select_question() -> void:
	$SpeechBubbleLeft/AnswerLabelLeft.text = "Ele indicaria a porta direita."
	$SpeechBubbleRight/AnswerLabelRight.text = "Ele indicaria a porta direita."

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

func _on_question_button_1_pressed() -> void:
	select_question()
