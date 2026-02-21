extends Node2D
@onready var anim = $AnimatedSprite2D

var player_in_range = false

func _ready() -> void:
	anim.play("idle")

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("trigger_action"):
		trigger_dialogue()

func trigger_dialogue():
	var timeline_path = "res://Dialogic/timeline.dtl"
	Dialogic.start(timeline_path)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range = false
