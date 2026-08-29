extends Control

var correctDoor = "DoorLeft"
var truthGuard = "GuardLeft"
var selectedQuestion = 0
var questionAsked = false

@export var questions: Array[QuestionData]
@export var goodEquipment: EquipmentData
@export var badEquipment: EquipmentData

func _ready() -> void:
	print("PODER AO ENTRAR NA SALA: ", GameManager.playerData.totalPower)
	
	$DoorLeft.disabled = true
	$DoorRight.disabled = true
	$DoorLeft/ProgressBar.value = 0
	$DoorRight/ProgressBar.value = 0

func select_question(questionNumber: int) -> void:
	if questionAsked:
		return
	
	questionAsked = true
	selectedQuestion = questionNumber
	
	var question = questions[questionNumber - 1]
	
	$QuestionPanel/QuestionLabel.text = question.questionText
	set_guard_answers(question)
	
	$DoorLeft.disabled = false
	$DoorRight.disabled = false
	
	$DoorLeft/ProgressBar.value = 0
	$DoorRight/ProgressBar.value = 0
	
	$QuestionsPanel/QuestionButton1.disabled = true
	$QuestionsPanel/QuestionButton2.disabled = true
	$QuestionsPanel/QuestionButton3.disabled = true

func set_guard_answers(question: QuestionData) -> void:
	if truthGuard == "GuardLeft":
		$GuardLeft.set_answer(question.truthfulAnswer)
		$GuardRight.set_answer(question.liarAnswer)
	else:
		$GuardLeft.set_answer(question.liarAnswer)
		$GuardRight.set_answer(question.truthfulAnswer)

func process_door_choice(door) -> void:
	print("PORTA ESCOLHIDA: ", door.name)
	
	var equipment: EquipmentData
	
	if door.name == correctDoor:
		print("RESULTADO: ACERTOU!")
		equipment = goodEquipment
	else:
		print("RESULTADO: ERROU!")
		equipment = badEquipment
	
	GameManager.playerData.currentEquipment = equipment
	GameManager.playerData.totalPower += equipment.power
	
	print("EQUIPAMENTO: ", equipment.equipmentName)
	print("PODER DO ITEM: ", equipment.power)
	print("PODER TOTAL: ", GameManager.playerData.totalPower)

func _on_door_left_door_confirmed(door) -> void:
	process_door_choice(door)

func _on_door_right_door_confirmed(door) -> void:
	process_door_choice(door)

func _on_question_button_1_pressed() -> void:
	select_question(1)
	print("Pergunta escolhida: ", selectedQuestion)

func _on_question_button_2_pressed() -> void:
	select_question(2)
	print("Pergunta escolhida: ", selectedQuestion)

func _on_question_button_3_pressed() -> void:
	select_question(3)
	print("Pergunta escolhida: ", selectedQuestion)
