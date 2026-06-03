extends Control

const NEW_GAME_SCENE := "res://scenes/tavern.tscn"
const RESUME_GAME_SCENE := "res://scenes/resume_game.tscn"
const LOAD_GAME_SCENE := "res://scenes/load_game.tscn"
const OPTIONS_SCENE := "res://scenes/options.tscn"

@onready var new_game_button: Button = $CenterContainer/VBoxContainer/NewGameButton
@onready var resume_game_button: Button = $CenterContainer/VBoxContainer/ResumeGameButton
@onready var load_game_button: Button = $CenterContainer/VBoxContainer/LoadGameButton
@onready var options_button: Button = $CenterContainer/VBoxContainer/OptionsButton
@onready var exit_button: Button = $CenterContainer/VBoxContainer/ExitButton


func _ready() -> void:
	new_game_button.pressed.connect(_on_new_game_pressed)
	resume_game_button.pressed.connect(_on_resume_game_pressed)
	load_game_button.pressed.connect(_on_load_game_pressed)
	options_button.pressed.connect(_on_options_pressed)
	exit_button.pressed.connect(_on_exit_pressed)


func _on_new_game_pressed() -> void:
	_change_scene(NEW_GAME_SCENE)


func _on_resume_game_pressed() -> void:
	_change_scene(RESUME_GAME_SCENE)


func _on_load_game_pressed() -> void:
	_change_scene(LOAD_GAME_SCENE)


func _on_options_pressed() -> void:
	_change_scene(OPTIONS_SCENE)


func _on_exit_pressed() -> void:
	get_tree().quit()


func _change_scene(scene_path: String) -> void:
	var error := get_tree().change_scene_to_file(scene_path)
	if error != OK:
		push_error("Failed to change scene to %s (error %d)" % [scene_path, error])
