extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const WALL_JUMP_VELOCITY = -250.0
const MIDAIR_SPEED = 100.0
const FRICTION = 0.2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var paused = false

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var wall_jump_timer = $WallJumpTimer


func _physics_process(delta):
	if paused:
		return

	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("move_left", "move_right")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	var wall_direction = 1 if animated_sprite.flip_h else -1

	if is_on_wall():
		if Input.is_action_just_pressed("jump"):
			velocity.y = WALL_JUMP_VELOCITY
			velocity.x = wall_direction * MIDAIR_SPEED
			animated_sprite.flip_h = !animated_sprite.flip_h
			wall_jump_timer.start()

		elif velocity.y > 0:
			velocity.y = lerp(velocity.y, 0.0, FRICTION)

	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	if direction:
		if (is_on_wall() and wall_jump_timer.time_left > 0.0) or wall_direction == direction:
			pass
		elif not is_on_floor():
			velocity.x = direction * MIDAIR_SPEED
		elif is_on_floor():
			velocity.x = direction * SPEED
	elif not is_on_wall() and wall_jump_timer.time_left <= 0.0:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
