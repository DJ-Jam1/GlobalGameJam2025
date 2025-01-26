extends Node3D

signal destroy
# Called when the node enters the scene tree for the first time.


func _on_hitbox_body_exited(body: Node3D) -> void:
	if body.name == 'player':
		emit_signal('destroy')
	elif body.name == null:
		pass


func _on_crate_10_add_score_2() -> void:
	pass # Replace with function body.
