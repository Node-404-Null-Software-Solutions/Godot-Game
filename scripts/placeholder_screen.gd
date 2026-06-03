extends Control

@export var screen_title: String = "Screen"
@export var screen_message: String = "This is a placeholder screen."
@export var back_button_text: String = "Back to Menu"
@export var back_scene_path: String = "res://scenes/main_menu.tscn"

@onready var title_label: Label = $CenterContainer/VBoxContainer/TitleLabel
@onready var message_label: Label = $CenterContainer/VBoxContainer/MessageLabel
@onready var back_button: Button = $CenterContainer/VBoxContainer/BackButton


func _ready() -> void:
	title_label.text = screen_title
	message_label.text = screen_message
	back_button.text = back_button_text
	back_button.pressed.connect(_on_back_pressed)


func _on_back_pressed() -> void:
	var error := get_tree().change_scene_to_file(back_scene_path)
	if error != OK:
		push_error("Failed to return to menu (error %d)" % error)
