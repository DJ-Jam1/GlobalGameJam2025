extends Node3D
# Reference to the player node

var input_enabled = false  # Variable to track if input is enabled

var players: Array

func _ready():
	players = get_tree().get_nodes_in_group("players")
	if players.size() > 0:
		var player = players[0]  # Assuming there's only one player
		print(player)  # This should print the player node
		_delay_player_input()
	

# Function to delay player input
func _delay_player_input():
	for player in players:
		player.set_input_enabled(false)  # Disable movement
		$"../Timer".start()
		player.set_input_enabled(true)  # Enable movement after delay
		print("Player input is now enabled.")
	
