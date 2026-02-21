extends AnimatedSprite2D

@export var interval: float = 3.0

func _ready() -> void:
	play_leaves_loop()

func play_leaves_loop() -> void:
	while true:
		play("dropping_leaves") # make sure this matches your animation name
		await animation_finished
		await get_tree().create_timer(interval).timeout
