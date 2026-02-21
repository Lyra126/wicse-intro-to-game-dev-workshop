extends Node2D
@onready var area = $Area2D
@onready var button = $Button
@onready var anim = $AnimatedSprite2D

var player_in_range = false
var has_fruit = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.visible = false
	anim.play("has_fruit")

func _process(delta):
	if player_in_range and has_fruit and Input.is_action_just_pressed("trigger_action"):
		pick_fruit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		if has_fruit:
			button.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		button.visible = false

func pick_fruit():
	has_fruit = false
	button.visible = false
	anim.play("no_fruit")
