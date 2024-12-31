class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var enchantments_button = $MarginContainer/HBoxContainer/VBoxContainer/EnchantmentsButton as Button

@onready var start_level = preload("res://scenes/game.tscn") as PackedScene
@onready var enchanments_menu = preload("res://scenes/enchantments_menu.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_connecting_signals()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func on_enchantments_pressed() -> void:
	get_tree().change_scene_to_packed(enchanments_menu)

func on_exit_pressed() -> void:
	get_tree().quit()

func handle_connecting_signals() -> void:
	start_button.button_up.connect(on_start_pressed)
	exit_button.button_up.connect(on_exit_pressed)
	enchantments_button.button_up.connect(on_enchantments_pressed)
	
