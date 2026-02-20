extends CharacterBody2D
const SPEED = 300.0
@onready var anim = $AnimatedSprite2D
var last_dir := "down"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1
	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	velocity = dir.normalized() * SPEED
	move_and_slide()
	if velocity == Vector2.ZERO:
		# No movement → idle in last facing direction
		match last_dir:
			"up":
				anim.play("idle_up")
			"down":
				anim.play("idle_down")
			"left":
				anim.play("idle_left")
			"right":
				anim.play("idle_right")
	else:
		if abs(velocity.x) > abs(velocity.y):
			# Horizontal movement
			if velocity.x > 0:
				anim.play("walk_right")
				last_dir = "right"
			else:
				anim.play("walk_left")
				last_dir = "left"
		else:
			# Vertical movement
			if velocity.y > 0:
				anim.play("walk_down")
				last_dir = "down"
			else:
				anim.play("walk_up")
				last_dir = "up"
