extends CharacterBody3D

signal knockback

#const NAME = 'player'
var input_enabled = false  # Initially, input is enabled
const SPEED = 25
const JUMP_VELOCITY = 4.5
var knockback_direction = Vector2();
var knockback_wait = 10;
var direction;
@export var player_id = 1

var sphere_center = Vector3(0, 40, -5)  # Replace with actual sphere center
var sphere_radius = 25  # Replace with your sphere's radius


	



func _physics_process(delta: float) -> void:
	
	if (input_enabled):
		if (Input.is_action_just_pressed("attack_%"%[player_id])):
			$AnimationPlayer.play("attack_animation")
	
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

	# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir := Input.get_vector("move_left_%s"%[player_id], "move_right_%s"%[player_id], 
										"move_up_%s"%[player_id], "move_down_%s"%[player_id])
		direction = (transform.basis * Vector3(input_dir.x,input_dir.y ,0 )).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.y = -direction.y * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED) 

		move_and_slide()
		 # Check if the player is within the sphere
		var distance_to_center = global_transform.origin.distance_to(sphere_center)
		if distance_to_center > sphere_radius:
		# Move player back inside the sphere
			var direction_to_center = (sphere_center - global_transform.origin).normalized()
			global_transform.origin = sphere_center - direction_to_center * sphere_radius

	


func _on_bubble_destroy() -> void:
	print('Death')
	
# Methods to enable/disable movement
func set_input_enabled(enabled: bool):
	input_enabled = enabled
