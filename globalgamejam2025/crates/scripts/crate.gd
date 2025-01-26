extends RigidBody3D

signal addScore1
signal addScore2

const NAME = 'crate'
var knockback_dir
var knockback
var knock_force = 20;
var dir =1;
@export var health = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	


func _on_bubble_destroy() -> void:
	queue_free();

func take_damage(damage:float)-> void:
	health -= damage
	print(health)
func death()->void:
	queue_free()
	

	
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


func _on_hitbox_body_entered(body: Node3D) -> void:
		if body.is_in_group("players"):  # Check if the body is a player
			print("Hit player: ", body.name)  # Log or handle the hit player

		# Random direction for knockback
			var random_direction = Vector3(randf_range(-1, 1), randf_range(-1, 1), 0).normalized()
			var random_rotation = Vector3(randf_range(-1, 1), randf_range(-1, 1), randf_range(-1, 1)).normalized()
			var knockback_vector = (random_direction + random_rotation) * knock_force
		
		# Apply knockback force
			if body.has_method("apply_force"):  # Ensure the player has this method
				body.apply_force(knockback_vector, Vector3.ZERO)

		# Handle damage and score based on player type
			if health > 0:
				await take_damage(1)  # Assuming take_damage is an async function

			if health <= 0:
				if body.name == 'Player':
					var scoreToAdd = 1
					emit_signal("addScore1")
					print("Signal emitted: addScore1")
					death()
				elif body.name == 'Player2':
					var scoreToAdd = 1
					emit_signal("addScore2")
					print("Signal emitted: addScore2")
					death()  # Call death function
