extends Control

@onready var button = $Button
var number: String = "1"

func _ready():
	$Button.text = number

func _on_button_pressed():
	SceneManager.loadLevel($Button.text)
	pass # Replace with function body.
