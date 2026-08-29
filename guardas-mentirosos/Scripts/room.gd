extends Control

var selectedQuestion = 0
var questionAsked = false
var doorChosen = false

@export var roomData: RoomData

func _ready() -> void:
	roomData = GameManager.rooms[GameManager.currentRoom - 1]
	
	print("SALA ATUAL: ", GameManager.currentRoom)
	print("PODER AO ENTRAR NA SALA: ", GameManager.playerData.totalPower)
	
	$DoorLeft.disabled = true
	$DoorRight.disabled = true
	$DoorLeft/ProgressBar.value = 0
	$DoorRight/ProgressBar.value = 0
	
	update_question_buttons()

func select_question(questionNumber: int) -> void:
	if questionAsked:
		return
	
	questionAsked = true
	selectedQuestion = questionNumber
	
	var question = roomData.questions[questionNumber - 1]
	
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
	if roomData.truthGuard == "GuardLeft":
		$GuardLeft.set_answer(question.truthfulAnswer)
		$GuardRight.set_answer(question.liarAnswer)
	else:
		$GuardLeft.set_answer(question.liarAnswer)
		$GuardRight.set_answer(question.truthfulAnswer)

func process_door_choice(door) -> void:
	if doorChosen:
		return
	
	doorChosen = true
	
	$DoorLeft.disabled = true
	$DoorRight.disabled = true
	
	print("PORTA ESCOLHIDA: ", door.name)
	
	var equipment: EquipmentData
	
	if door.name == roomData.correctDoor:
		print("RESULTADO: ACERTOU!")
		equipment = roomData.goodEquipment
	
		$EquipmentPanel/EquipmentTitle.text = "EQUIPAMENTO DE QUALIDADE!"
		$EquipmentPanel/EquipmentDescription.text = "Você fez a escolha certa e encontrou um equipamento poderoso."
	else:
		print("RESULTADO: ERROU!")
		equipment = roomData.badEquipment
	
		$EquipmentPanel/EquipmentTitle.text = "EQUIPAMENTO DEFEITUOSO!"
		$EquipmentPanel/EquipmentDescription.text = "Você escolheu a porta errada e encontrou um equipamento inferior."
	
	GameManager.add_equipment(equipment)
	
	print("EQUIPAMENTO: ", equipment.equipmentName)
	print("PODER DO ITEM: ", equipment.power)
	print("PODER TOTAL: ", GameManager.playerData.totalPower)
	
	$EquipmentPanel/EquipmentName.text = equipment.equipmentName
	$EquipmentPanel/EquipmentPower.text = "Poder: +" + str(equipment.power)
	$EquipmentPanel/TotalPower.text = "Poder total: " + str(GameManager.playerData.totalPower)

	$EquipmentPanel.show()

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

func _on_continue_button_pressed() -> void:
	GameManager.go_to_next_room()
	GameManager.load_next_room()

func update_question_buttons() -> void:
	if roomData.questions.size() < 3:
		print("ERRO: A sala não possui 3 perguntas configuradas.")
		return
	
	$QuestionsPanel/QuestionButton1.text = roomData.questions[0].questionText
	$QuestionsPanel/QuestionButton2.text = roomData.questions[1].questionText
	$QuestionsPanel/QuestionButton3.text = roomData.questions[2].questionText
