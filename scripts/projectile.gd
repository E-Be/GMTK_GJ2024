extends CharacterBody2D
class_name Projectile

const MINUS = preload("res://sprites/Projectiles/minus.png")
const PLUS = preload("res://sprites/Projectiles/plus.png")
const EXPLOSION_PARTICULES = preload("res://scenes/explosion_particules.tscn")

@onready var timer = $Timer
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var collision_shape_2d = $CollisionShape2D
@onready var collision_shape_hurtbox = $HurtBox/CollisionShape2D

@export var hurtbox : Hurtbox
@export var speed : float = 350

var effect: Constants.StateChange
var direction: Vector2

func _ready():
	timer.start(1)
	
	if (effect == Constants.StateChange.MINUS):
		sprite.texture = MINUS
	else :
		sprite.texture = PLUS
		
	hurtbox.effect = effect
	hurtbox.contact.connect(die)
	
func _physics_process(delta):
	
	velocity = direction * speed
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		die()

func _on_timer_timeout():
	die()

func disapear():
	speed = 0
	sprite.visible = false
	collision_shape_2d.set_deferred("disabled", true)
	collision_shape_2d.set_deferred("monitoring", false)
	collision_shape_hurtbox.set_deferred("disabled", true)
	collision_shape_hurtbox.set_deferred("monitoring", false)
	
	
func die():
	var newParticules = EXPLOSION_PARTICULES.instantiate()
	if (effect == Constants.StateChange.MINUS):
		newParticules.color = Color.BLUE
	else :
		newParticules.color = Color.RED
	add_child(newParticules)
	animation_player.play("death")

