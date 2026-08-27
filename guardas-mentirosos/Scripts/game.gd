extends Control
# Define que este script herda de Control.
# Portanto, ele deve estar anexado a um nó do tipo Control.
# Esse provavelmente é o nó principal da sua interface/cena.

var correctDoor = "DoorLeft"
# Guarda o nome da porta correta.
# Neste momento, a porta correta é "DoorLeft".
# Importante: essa variável ainda não está sendo utilizada
# em nenhuma função do código.

var truthGuard = "GuardLeft"
# Guarda o nome do guarda que fala a verdade.
# Neste momento, é o "GuardLeft".
# Assim como correctDoor, essa variável ainda não está sendo
# utilizada diretamente na lógica.

func select_question() -> void:
	# Função responsável por selecionar/apresentar uma pergunta.
	# Atualmente ela simplesmente define o texto das respostas
	# dos dois guardas.

	$SpeechBubbleLeft/AnswerLabelLeft.text = "Ele indicaria a porta direita."
	# Acessa a caixa de fala do guarda da esquerda.
	# Dentro dela, acessa o AnswerLabelLeft.
	# Depois altera o texto exibido para:
	# "Ele indicaria a porta direita."

	$SpeechBubbleRight/AnswerLabelRight.text = "Ele indicaria a porta direita."
	# Faz a mesma coisa para o guarda da direita.
	# Portanto, atualmente os dois guardas mostram a mesma resposta.

func _on_door_left_door_confirmed(door) -> void:
	# Esta função é chamada quando o sinal doorConfirmed
	# da porta esquerda é emitido.

	print("PORTA ESCOLHIDA: ", door.name)
	# Mostra no console o nome da porta que foi escolhida.
	# Como o primeiro script envia:
	# doorConfirmed.emit(self)
	# o parâmetro "door" aqui recebe o próprio botão da porta.
	# door.name retorna o nome desse botão.
	# Exemplo no console:
	# PORTA ESCOLHIDA: DoorLeft

func _on_door_right_door_confirmed(door) -> void:
	# Mesma lógica da função anterior,
	# mas relacionada à porta direita.

	print("PORTA ESCOLHIDA: ", door.name)
	# Mostra no console o nome da porta direita que foi confirmada.

func _on_guard_right_mouse_entered() -> void:
	# É chamada quando o mouse entra na área do guarda direito.

	$SpeechBubbleRight.show()
	# Mostra a caixa de fala do guarda direito.

func _on_guard_right_mouse_exited() -> void:
	# É chamada quando o mouse sai da área do guarda direito.

	$SpeechBubbleRight.hide()
	# Esconde a caixa de fala do guarda direito.

func _on_guard_left_mouse_entered() -> void:
	# É chamada quando o mouse entra na área do guarda esquerdo.

	$SpeechBubbleLeft.show()
	# Mostra a caixa de fala do guarda esquerdo.

func _on_guard_left_mouse_exited() -> void:
	# É chamada quando o mouse sai da área do guarda esquerdo.
	
	$SpeechBubbleLeft.hide()
	# Esconde a caixa de fala do guarda esquerdo.

func _on_question_button_1_pressed() -> void:
	# É chamada quando o QuestionButton1 é pressionado.

	select_question()
	# Chama a função select_question().
	# Isso faz os textos dos dois guardas serem atualizados.
