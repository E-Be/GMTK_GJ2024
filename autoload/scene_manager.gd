extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var color_rect = $ColorRect

var nextScene:String

func _ready():
	setVisible(false)
	
func loadLevel(level: String):
	nextScene = "res://scenes/level" + level + ".tscn"
	transition()

func transition():
	setVisible(true)
	animation_player.play("fade_to_black")

func setVisible(visible: bool):
	color_rect.visible = visible
	
func fadeToNormal():
	animation_player.play("fade_to_transparent")
	
func changeScene():
	get_tree().change_scene_to_file(nextScene)
