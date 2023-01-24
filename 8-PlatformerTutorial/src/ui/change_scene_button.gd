@tool
extends Button

@export_file var next_scene_path: = "" 

func _on_button_up():
	get_tree().change_scene_to_file(next_scene_path)

func _get_configuration_warnings():
	return "next_scene_path must be set" if next_scene_path == "" else ""
