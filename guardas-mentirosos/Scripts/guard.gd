extends Button

@export var speechBubble: Control
@export var answerLabel: Label

func _ready() -> void:
	mouse_entered.connect(show_answer)
	mouse_exited.connect(hide_answer)

func show_answer() -> void:
	speechBubble.show()

func hide_answer() -> void:
	speechBubble.hide()

func set_answer(answer: String) -> void:
	answerLabel.text = answer
