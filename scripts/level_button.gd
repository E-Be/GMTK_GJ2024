extends Control

@onready var button = $Button
signal loadLevel(level: String)
var number: String = "1"

func _ready():
	$Button.text = number

func _on_button_pressed():
	loadLevel.emit($Button.text)
	pass # Replace with function body.
