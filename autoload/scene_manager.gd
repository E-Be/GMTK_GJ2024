extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var color_rect = $ColorRect

func _ready():
	setVisible(false)

func transition():
	setVisible(true)
	animation_player.play("fade_to_black")

func setVisible(visible: bool):
	color_rect.visible = visible
	
func fadeToNormal():
	animation_player.play("fade_to_transparent")
