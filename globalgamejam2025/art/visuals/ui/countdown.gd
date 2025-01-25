extends Control
signal roundOver
@onready var label = $Counter/Label
@onready var timer = $Counter/Label/countdown



	
func _process(delta: float) -> void:
		update_label_tex()

	
func update_label_tex()-> void:
	label.text = str(ceil(timer.time_left))

func _on_countdown_timeout() -> void:
	emit_signal('roundOver')
	print('game finished')
	
