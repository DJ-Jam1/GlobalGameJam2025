extends RigidBody3D
const NAME = 'crate'
var knockback_dir
var knockback
var knock_force = 10;
var dir =1;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



	


func _on_player_knockback() -> void:
	print('Apply Knockback')
	   # Adjust as needed
	var random_direction = Vector3(randf_range(-1, 1), randf_range(-1, 1), 0).normalized();
	var knockback_vector = random_direction * knock_force;
	print(knockback_vector);
	# Use add_force instead of apply_impulse
	apply_force(knockback_vector, Vector3.ZERO);
