extends CharacterBody2D

@export var speed: float = 150.0
@onready var progress_bar: ProgressBar = $ProgressBar

func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	move_and_slide()

func take_damage() -> void:
	progress_bar.value -= 1
