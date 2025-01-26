extends Node3D

@export var mob_scene: PackedScene
var spawnDirection: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



	


func _on_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	# Spawn the mob by adding it to the Main scene.
	var mob_spawn_location = get_node("Area3D")
	spawnDirection = mob_spawn_location.y
	
	mob.initialize(mob_spawn_location.position,spawnDirection)
	add_child(mob)
