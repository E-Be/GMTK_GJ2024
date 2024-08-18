extends Control

@onready var main_menu = %MainMenu
@onready var level_select = %LevelSelect
@onready var level_list = %LevelList
@export var nbOfLevel = 7
var levelButton = preload("res://scenes/level_button.tscn")

func _ready():
	for i in range(nbOfLevel):
		var newButton = levelButton.instantiate()
		newButton.number = str(i+1)
		level_list.add_child(newButton)
		

func _on_start_button_pressed():
	self.visible = false
	SceneManager.loadLevel("1")
	pass # Replace with function body.



func _on_back_button_pressed():
	level_select.visible = false
	main_menu.visible = true
	pass # Replace with function body.


func _on_level_select_pressed():
	level_select.visible = true
	main_menu.visible = false
	pass # Replace with function body.
