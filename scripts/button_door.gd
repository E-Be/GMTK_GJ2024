extends StaticBody2D

@export var button: DoorButton
@onready var tile_map = $TileMap
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	button.isActivatedSignal.connect(openClose)
	
func openClose(open: bool):
	if open:
		tile_map.visible = false
		collision_shape_2d.set_deferred("disabled", true)
	else:
		tile_map.visible = true
		collision_shape_2d.set_deferred("disabled", false)
