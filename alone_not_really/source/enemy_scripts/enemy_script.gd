extends KinematicBody2D

var speed = 30
var velocity = Vector2()
var acceleration = 2
var player = null

onready var sprite = $Sprite

func _physics_process(delta):
	if player:
		velocity = position.direction_to(player.position) * speed * acceleration
	velocity = move_and_slide(velocity)
	if velocity >= Vector2.LEFT:
		sprite.flip_h = true
	if velocity >= Vector2.RIGHT:
		sprite.flip_h = false
		velocity.x *= 0.8
		velocity.y += 0.7

func _on_detect_radius_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_detect_radius_body_exited(body):
	if body.is_in_group("player"):
		player = null
		velocity.x = 0
		velocity.y = 0

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.play_dead_anim()
