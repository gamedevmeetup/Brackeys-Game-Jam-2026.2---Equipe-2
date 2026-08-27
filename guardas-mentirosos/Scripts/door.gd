extends Button

signal doorConfirmed

@export var holdTime: float = 2.0

var hoverTime: float = 0.0
var isHovering: bool = false
var confirmed: bool = false


func _process(delta: float) -> void:
	if isHovering and not confirmed:
		hoverTime += delta
		$ProgressBar.value = (hoverTime / holdTime) * 100.0

		if hoverTime >= holdTime:
			confirmed = true
			doorConfirmed.emit()


func _on_mouse_entered() -> void:
	if not confirmed:
		isHovering = true


func _on_mouse_exited() -> void:
	if not confirmed:
		isHovering = false
		hoverTime = 0.0
		$ProgressBar.value = 0.0


func _on_door_confirmed() -> void:
	pass # Replace with function body.
