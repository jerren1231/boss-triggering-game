extends CharacterBody2D

@onready var ray_cast = $RayCast2D
@onready var player = get_parent().find_child("player")
@onready var progress_bar = $ProgressBar
var health = 2:
	set(value):
		health = value
		progress_bar.value = value 
		
var direction = Vector2.RIGHT
var speed = 80.0

func _ready():
	set_physics_process(false)

func _process(_delta):
	direction = (player.position - global_position).normalized()
	ray_cast.target_position = direction * 350
	
func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
	
