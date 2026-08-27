extends Button
# Define que este script herda de Button.
# Portanto, ele deve estar anexado a um nó do tipo Button.

signal doorConfirmed(door)
# Cria um sinal chamado "doorConfirmed".
# Esse sinal pode avisar outros objetos quando a porta for confirmada.
# "door" é o parâmetro que será enviado junto com o sinal.

@export var holdTime: float = 2.0
# Cria uma variável editável pelo Inspector.
# Define quanto tempo o mouse precisa permanecer sobre o botão.
# O valor padrão é 2 segundos.

var hoverTime: float = 0.0
# Guarda quanto tempo o mouse já permaneceu sobre o botão.
# Começa em 0.

var isHovering: bool = false
# Indica se o mouse está atualmente sobre o botão.
# false = não está sobre o botão.
# true = está sobre o botão.

var confirmed: bool = false
# Indica se a porta já foi confirmada.
# Enquanto for false, o jogador ainda pode interagir com a porta.
# Quando se torna true, a porta não pode mais ser confirmada novamente.

func _process(delta: float) -> void:
	# _process é executado a cada frame do jogo.
	# "delta" representa o tempo, em segundos, desde o último frame.

	if isHovering and not confirmed:
		# Verifica duas condições:
		# 1. O mouse está sobre o botão.
		# 2. A porta ainda não foi confirmada.
		# Só entra nesse bloco se as duas condições forem verdadeiras.

		hoverTime += delta
		# Soma o tempo passado desde o último frame ao hoverTime.
		# Dessa forma, conseguimos medir quanto tempo o mouse ficou sobre o botão.

		$ProgressBar.value = (hoverTime / holdTime) * 100.0
		# Atualiza a ProgressBar de acordo com o tempo de espera.
		# Exemplo:
		# holdTime = 2 segundos
		# hoverTime = 1 segundo
		# 1 / 2 * 100 = 50
		# Portanto, a barra ficará em 50%.

		if hoverTime >= holdTime:
			# Verifica se o tempo necessário foi atingido.

			confirmed = true
			# Marca a porta como confirmada.
			# Isso impede que o processo continue contando tempo.

			doorConfirmed.emit(self)
			# Emite o sinal "doorConfirmed".
			# "self" envia este próprio botão como argumento.
			# Quem estiver conectado a esse sinal poderá saber
			# exatamente qual porta foi confirmada.

func _on_mouse_entered() -> void:
	# Essa função é chamada quando o mouse entra na área do botão.

	if not confirmed:
		# Só permite iniciar o processo se a porta ainda não tiver sido confirmada.

		isHovering = true
		# Informa ao _process que o mouse está sobre o botão.
		# A partir daqui, hoverTime começa a aumentar.

func _on_mouse_exited() -> void:
	# Essa função é chamada quando o mouse sai da área do botão.

	if not confirmed:
		# Só executa se a porta ainda não tiver sido confirmada.

		isHovering = false
		# Informa que o mouse saiu do botão.
		# O contador deixa de aumentar.

		hoverTime = 0.0
		# Reseta o tempo acumulado.
		# Se o jogador tinha segurado por 1.5 segundos e sair,
		# terá que começar novamente do zero.

		$ProgressBar.value = 0.0
		# Também reseta visualmente a barra de progresso.

func _on_door_confirmed() -> void:
	# Atualmente ela não faz nada.
	pass # Replace with function body.
	# "pass" significa simplesmente "não faça nada".
