extends CharacterBody2D
class_name Projectile

@onready var timer = $Timer

@export var hurtbox : Hurtbox
@export var speed : float = 200

var effect: Constants.StateChange
var direction: Vector2

func _ready():
	timer.start(1)
	if hurtbox:
		hurtbox.effect = effect
	
func _physics_process(delta):
	
	velocity = direction * speed
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		queue_free()

func _on_timer_timeout():
	queue_free()

