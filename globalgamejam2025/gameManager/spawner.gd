extends Node3D

@export var mob_scene: PackedScene
var spawnDirection: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.start()
	



	


func _on_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	add_child(mob)

	
