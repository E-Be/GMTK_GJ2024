extends Node2D

func _on_area_2d_body_entered(body):
	if (body is Player):
		body.canMove = false
		SoundManager.playDoorSound()
		SceneManager.loadNextLevel()
