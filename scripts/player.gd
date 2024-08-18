class_name Player extends CharacterBody2D

const SPEED = 150

@export var jumpHeigth: float = 48
@export var jumpTimeToPeak: float = 0.4
@export var jumpTimeToDescent: float = 0.25

@export var push_force = 10

@export var weapon: Weapon

@onready var jump_velocity: float = ((2.0 * jumpHeigth) / jumpTimeToPeak ) * -1
@onready var jump_gravity: float = ((-2.0 * jumpHeigth) / (jumpTimeToPeak * jumpTimeToPeak)) * -1
@onready var fall_gravity: float = ((-2.0 * jumpHeigth) / (jumpTimeToPeak * jumpTimeToDescent)) * -1
@onready var coyote_jump_timer = $CoyoteJumpTimer

var shootDirection: Vector2 = Vector2(1,0)
var canMove = true
var isCoyoteJumpAvailable = true

func jump():
	SoundManager.playJump()
	velocity.y = jump_velocity
	
func getGravity():
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += getGravity() * delta
		if coyote_jump_timer.is_stopped() and isCoyoteJumpAvailable:
			coyote_jump_timer.start()
	else:
		isCoyoteJumpAvailable = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and canMove:
		if is_on_floor():
			jump()
			isCoyoteJumpAvailable = false
		elif not coyote_jump_timer.is_stopped() and isCoyoteJumpAvailable:
			isCoyoteJumpAvailable = false
			jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		shootDirection = Vector2(direction, 0)
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionY = Input.get_axis("look_up", "look_down")
	if directionY:
		shootDirection = Vector2(0, directionY)
		
	#Shoot
	if Input.is_action_pressed("shoot_minus"):
		if weapon:
			weapon.fire(Constants.StateChange.MINUS, shootDirection)
	if Input.is_action_pressed("shoot_plus"):
		if weapon:
			weapon.fire(Constants.StateChange.PLUS, shootDirection)
			
	#Reset level
	if Input.is_action_pressed("reload_scene"):
		SceneManager.reloadScene()

	if not canMove:
		velocity.x = 0
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if (collision.get_collider() is Crate && collision.get_collider().state == Constants.State.SMALL):
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)


func _on_coyote_jump_timer_timeout():
	isCoyoteJumpAvailable = false
