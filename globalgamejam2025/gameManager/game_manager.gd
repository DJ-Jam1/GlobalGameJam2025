extends Node
# Reference to the player node

var input_enabled = false  # Variable to track if input is enabled

var players: Array
var player_1_score=0
var player_1_label = Label
var player_2_score=0
var player_2_label = Label
@export var win_condition = "You Win"
var win_condition_contatiner = NinePatchRect
var win_condition_label = Label


func _ready():
	win_condition_contatiner = $PlayerScores/WinCondition
	win_condition_label = $PlayerScores/WinCondition/Label
	player_1_label = $PlayerScores/PlayerOneScore/Label
	player_2_label = $PlayerScores/PlayerTwoScore/Label
	players = get_tree().get_nodes_in_group("players")
	if players.size() > 0:
		var player = players[0]  # Assuming there's only one player
		#print(player)  # This should print the player node
		_delay_player_input()
		
	

# Function to delay player input
func _delay_player_input():
	for player in players:
		player.set_input_enabled(false)  # Disable movement
		%Timer.start()
		
		
func _on_timer_timeout() -> void:
	for player in players:
		player.set_input_enabled(true)  # Enable movement after delay
		print("Player input is now enabled.")
		


func _on_crate_add_score_1() -> void:
	var toalScore = player_1_score
	if toalScore < 10:
		toalScore+=1
		player_1_score = toalScore
		player_1_label.text = "Player 1 Score: " + str(toalScore)
	


func _on_crate_add_score_2() -> void:
	var toalScore = player_2_score
	if toalScore < 10:
		toalScore+=1
		player_2_score = toalScore
		player_2_label.text = "Player 2 Score: " + str(toalScore)


func _on_time_counter_round_over() -> void:
	win_condition_contatiner.visible =true
	if player_1_score >= player_2_score:
		print('player 1 wins')
		win_condition_label.text = "Player 1 is the winner"
		$backtoMenuTimer.start()
		
	else:
		print('player 2 wins')
		win_condition_label.text = "Player 2 is the winner"
		$backtoMenuTimer.start()
		


func _on_backto_menu_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
