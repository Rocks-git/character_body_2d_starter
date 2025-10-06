# Example script to load InputMap
extends Node

func _ready():
	var config = ResourceLoader.load("res://resources/user_input_map.tres")
	if config:
		# Clear existing actions (optional, depending on desired behavior)
		for action_name in InputMap.get_actions():
			if action_name not in ["forward", "backward", "shoot", "jump"] :
				InputMap.erase_action(action_name)
			else :
				print(action_name)

		# Apply loaded actions
		for action_name in config.input_actions:
			InputMap.add_action(action_name)
			for event in config.input_actions[action_name]:
				InputMap.action_add_event(action_name, event)
			
		print("InputMap loaded from user_input_map.tres")
	else:
		print("Failed to load InputMap config.")
