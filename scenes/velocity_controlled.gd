extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 300
@export var speed : int
var dir : Vector2

func _ready():
	win_size = get_viewport_rect().size
	new_ball()
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(dir*speed*delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider.get_parent() == $"../Walls" :
			dir = dir.bounce(collision.get_normal())
		else :
			dir = dir.bounce(collision.get_normal())
	
func new_ball():
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	dir = random_direction()
	
func random_direction() :
	var new_dir := Vector2()
	new_dir.x = [1, .75, .5, .25, -.25, -.5, -.75, -1].pick_random()
	new_dir.y = [1,-1].pick_random()
	
	return new_dir.normalized()
