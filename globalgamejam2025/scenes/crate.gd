extends RigidBody3D
const NAME = 'crate'
var knockback_dir
var knockback
var knock_force = 200;
var dir =1;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_knockback() -> void:
	var knockback_strength = 300  # Adjust this value as needed
	var random_direction = Vector3(randf_range(-1, 1), randf_range(-1, 1), 0).normalized()
	var knockback_vector = random_direction * knockback_strength
	
	# Apply the impulse
	apply_impulse(Vector3.ZERO, knockback_vector)
	
