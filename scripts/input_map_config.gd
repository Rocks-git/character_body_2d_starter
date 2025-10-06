	# Example script to save InputMap
extends Node

func _ready():
	var config = InputMapConfig.new()
	for action_name in InputMap.get_actions():
		var events = InputMap.action_get_events(action_name)
		config.input_actions[action_name] = events
	
	ResourceSaver.save(config, "res://user_input_map.tres")
	print("InputMap saved to user_input_map.tres")
