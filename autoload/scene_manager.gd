extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var color_rect = $ColorRect

var nextScene:String
var currentScene:String

func _ready():
	currentScene = "World"
	setVisible(false)
	
func _process(delta):
	if (Input.is_action_pressed("main_menu")):
		loadLevel("World")
	
func loadNextLevel():
	if (currentScene.is_valid_int()):
		nextScene = str(int(currentScene) + 1)
		transition()
	
func loadLevel(level: String):
	nextScene = level
	transition()

func transition():
	setVisible(true)
	animation_player.play("fade_to_black")

func setVisible(visible: bool):
	color_rect.visible = visible
	
func fadeToNormal():
	currentScene = nextScene
	animation_player.play("fade_to_transparent")
	
func changeScene():
	get_tree().change_scene_to_file("res://scenes/levels/level" + nextScene + ".tscn")
	
func reloadScene():
	loadLevel(currentScene)
