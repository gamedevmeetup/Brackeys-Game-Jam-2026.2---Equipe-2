extends Button

#Variáveis
@export var holdTime: float = 2.0

var hoverTime: float = 0.0
var isHovering: bool = false

func _process(delta: float) -> void:
	if isHovering:
		hoverTime += delta
		$ProgressBar.value = (hoverTime / holdTime) * 100.0

		if hoverTime >= holdTime:
			print("PORTA ESCOLHIDA!")


func _on_mouse_entered() -> void:
	isHovering = true


func _on_mouse_exited() -> void:
	isHovering = false
	hoverTime = 0.0
	$ProgressBar.value = 0.0
