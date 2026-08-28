extends Control

var correctDoor = "DoorLeft"
var truthGuard = "GuardLeft"
var selectedQuestion = 0

func _ready() -> void:
	$DoorLeft.disabled = true
	$DoorRight.disabled = true
	$DoorLeft/ProgressBar.value = 0
	$DoorRight/ProgressBar.value = 0

func select_question(questionNumber: int) -> void:
	selectedQuestion = questionNumber
	match selectedQuestion:
		1:
			$QuestionPanel/QuestionLabel.text = "Se eu perguntasse ao outro guarda qual porta leva ao tesouro, qual ele indicaria?"
			
			$SpeechBubbleLeft/AnswerLabelLeft.text = "Ele indicaria a porta direita."
			$SpeechBubbleRight/AnswerLabelRight.text = "Ele indicaria a porta direita."

		2:
			$QuestionPanel/QuestionLabel.text = "Seu colega diria que a porta esquerda leva ao tesouro?"
		
			$SpeechBubbleLeft/AnswerLabelLeft.text = "Ele indicaria a porta direita."
			$SpeechBubbleRight/AnswerLabelRight.text = "Ele indicaria a porta direita."

		3:
			$QuestionPanel/QuestionLabel.text = "Seu colega diria que a porta esquerda leva ao tesouro?"
			
			$SpeechBubbleLeft/AnswerLabelLeft.text = "Sim."
			$SpeechBubbleRight/AnswerLabelRight.text = "Não."
			
	$DoorLeft.disabled = false
	$DoorRight.disabled = false
	$DoorLeft/ProgressBar.value = 0
	$DoorRight/ProgressBar.value = 0

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
	select_question(1)
	print("Pergunta escolhida: ", selectedQuestion)

func _on_question_button_2_pressed() -> void:
	select_question(2)
	print("Pergunta escolhida: ", selectedQuestion)

func _on_question_button_3_pressed() -> void:
	select_question(3)
	print("Pergunta escolhida: ", selectedQuestion)
