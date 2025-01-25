extends Node3D

@export var mob_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mob = mob_scene.instantiate()
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
