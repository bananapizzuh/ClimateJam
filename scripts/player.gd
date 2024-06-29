extends CharacterBody2D

# ==============================================================================
# Variables to handle the player's movement

@export_group("Player Variables")
@export var speed = 130.0
@export var jump_velocity = -200.0
@export var wall_jump_velocity = -250.0
@export var midair_speed = 100.0
@export var friction = 0.2

# ==============================================================================

# ==============================================================================
# Variables to handle the player's jump

var jump_buffer: bool = false
var coyote_time: bool = false

# ==============================================================================

# ==============================================================================
# Getting the default gravity from the project settings

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# ==============================================================================

# ==============================================================================
# Get the player's components

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var jump_buffer_timer = $JumpBufferTimer
@onready var coyote_timer = $CoyoteTimer

# ==============================================================================

func _physics_process(delta):
# ==============================================================================
# Apply gravity if the player is not on the floor

	if not is_on_floor():
		velocity.y += gravity * delta

# ==============================================================================

# ==============================================================================
# Handle the player's animations

	# Get the player's direction from the move_left and move_right inputs
	var direction = Input.get_axis("move_left", "move_right")

	# If the player is moving left, flip the sprite horizontally
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# If the player is not moving and on the floor, play the run animation
	# If the player is moving and on the floor, play the run animation
	# If the player is not on the floor, play the jump animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

# ==============================================================================

# ==============================================================================
# Handle the player's jump

	# Check if either the jump buffer timer or the coyote timer is done
	# If they are, then disable the jump_buffer and coyote_time
	if jump_buffer_timer.is_stopped():
		jump_buffer = false
	if coyote_timer.is_stopped():
		coyote_time = false

	# Ifs the player is on the floor, (re)start the coyote timer and enable coyote_time
	if is_on_floor():
		coyote_timer.start()
		coyote_time = true

	# If the player presses the jump button, and the player is on the floor and not on the wall, jump
	# If the player is not on the floor, but the coyote timer is still running, jump
	if Input.is_action_just_pressed("jump") and not is_on_wall():
		if coyote_time or is_on_floor():
			jump_buffer = false
			velocity.y = jump_velocity
		# If the player jumps and does not have coyote time or is not on the floor, enable the jump buffer
		else:
			jump_buffer = true
			jump_buffer_timer.start()

	# If the player is on the floor and the jump buffer is enabled, jump
	if is_on_floor() and jump_buffer:
		velocity.y = jump_velocity
		jump_buffer = false

# ==============================================================================

# ==============================================================================
# Handle wall jumping

	# Get the direction of the wall the player is on through the flip_h property
	# The flip_h property is used because it stores the direction the player is facing
	var wall_direction = 1 if animated_sprite.flip_h else - 1

	# If the player is on a wall, and the player presses the jump button, wall jump
	if is_on_wall():
		if Input.is_action_just_pressed("jump") and direction != 0:
			velocity.y = wall_jump_velocity
			velocity.x = wall_direction * midair_speed
			animated_sprite.flip_h = !animated_sprite.flip_h

		# If the player is on a wall, and the player is not pressing the jump button, slide down the wall
		elif velocity.y > 0:
			velocity.y = lerp(velocity.y, 0.0, friction)

# ==============================================================================

# ==============================================================================
# Handle the player's movement

	# If the player is moving in midair, move the player in that direction with midair_speed
	# If the player is moving left or right, move the player in that direction
	# If the player is not moving, slow the player down
	if direction:
		if not is_on_floor():
			velocity.x = direction * midair_speed
		elif is_on_floor():
			velocity.x = direction * speed
	elif not is_on_wall():
		velocity.x = move_toward(velocity.x, 0, speed)

# ==============================================================================

# ==============================================================================
# Actually move the player

	move_and_slide()

# ==============================================================================
