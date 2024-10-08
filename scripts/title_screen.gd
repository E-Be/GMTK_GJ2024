extends Control

@onready var main_menu = %MainMenu
@onready var level_select = %LevelSelect
@onready var level_list = %LevelList
@export var nbOfLevel = 10
var levelButton = preload("res://scenes/level_button.tscn")

func _ready():
	SoundManager.playMenuMusic()
	for i in range(nbOfLevel):
		var newButton = levelButton.instantiate()
		newButton.number = str(i+1)
		level_list.add_child(newButton)
		newButton.loadLevel.connect(loadLevel)
		

func _on_start_button_pressed():
	SoundManager.playLevelMusic()
	self.visible = false
	SceneManager.loadLevel("1")
	pass # Replace with function body.

func loadLevel(level: String):
	SoundManager.playLevelMusic()
	self.visible = false
	SceneManager.loadLevel(level)
	

func _on_back_button_pressed():
	level_select.visible = false
	main_menu.visible = true
	pass # Replace with function body.


func _on_level_select_pressed():
	level_select.visible = true
	main_menu.visible = false
	pass # Replace with function body.
