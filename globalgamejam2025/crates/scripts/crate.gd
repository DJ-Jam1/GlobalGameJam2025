extends RigidBody3D

signal addScore1
signal addScore2
const NAME = 'crate'
var knockback_dir
var knockback
var knock_force = 20;
var dir =1;
@export var health = 0



# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



	


func _on_player_knockback() -> void:
	   # Adjust as needed
	var random_direction = Vector3(randf_range(-1, 1), randf_range(-1, 1), 0).normalized();
	var random_rotation = Vector3(randf_range(-1, 1), randf_range(-1, 1),randf_range(-1, 1)).normalized();
	var knockback_vector = (random_direction * random_rotation) * knock_force;
	
	# Use add_force instead of apply_impulse
	apply_force(knockback_vector, Vector3.ZERO);
	if (health >= 0):
		await take_damage(1)
	if (health == 0) :
		emit_signal("addScore1");
		death();


func _on_bubble_destroy() -> void:
	queue_free();

func take_damage(damage:float)-> void:
	health -= 1
	print(health)
func death()->void:
	queue_free()
	
func _on_player_2_knockback() -> void:
	
	   # Adjust as needed
	var random_direction = Vector3(randf_range(-1, 1), randf_range(-1, 1), 0).normalized();
	var random_rotation = Vector3(randf_range(-1, 1), randf_range(-1, 1),randf_range(-1, 1)).normalized();
	var knockback_vector = (random_direction * random_rotation) * knock_force;
	
	# Use add_force instead of apply_impulse
	apply_force(knockback_vector, Vector3.ZERO);
	if (health >= 0):
		await take_damage(1)
	elif (health <=0) :
		emit_signal("addScore2");
		await death();



	
