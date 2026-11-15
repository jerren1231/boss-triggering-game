extends State
class_name ShootState
 
@export var ball_node : PackedScene 
@onready var timer = $Timer
 
func transition():
	if not ray_cast.is_colliding():
			get_parent().change_state("Follow")
 
func enter():
	super.enter()
	timer.start()
 
func exit():
	super.exit()
	timer.stop()
 
 
func _on_timer_timeout():
	shoot()
 
func shoot():
	var ball = ball_node.instantiate()
 
	ball.position = global_position
	ball.direction = (player.global_position - global_position).normalized()
 
	get_tree().current_scene.call_deferred("add_child",ball)
