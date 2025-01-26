extends Node3D

signal destroy



func _on_hitbox_body_exited(body: Node3D) -> void:
	if body.name == 'player':
		emit_signal('destroy')
	elif body.name == null:
		pass
