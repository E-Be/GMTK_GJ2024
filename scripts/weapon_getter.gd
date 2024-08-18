extends Area2D

const WEAPON = preload("res://scenes/weapon.tscn")

func _on_body_entered(body):
	if (body is Player):
		var newWeapon = WEAPON.instantiate()
		body.weapon = newWeapon
		body.add_child(newWeapon)
		queue_free()

