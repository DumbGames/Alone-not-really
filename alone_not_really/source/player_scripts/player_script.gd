extends KinematicBody2D

var velocity = Vector2()
var speed = 40
var acceleration = 2
var is_running = false

onready var sprite = $Sprite
onready var label = $CanvasLayer/Label
onready var anim = $AnimationPlayer


func _physics_process(delta):
	inputs()
	velocity = move_and_slide(velocity)


func inputs():
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y = -speed * acceleration

	elif Input.is_action_pressed("down"):
		velocity.y = speed * acceleration

	elif Input.is_action_pressed("right"):
		velocity.x = speed * acceleration
		sprite.flip_h = false

	elif Input.is_action_pressed("left"):
		velocity.x = -speed * acceleration
		sprite.flip_h = true


	velocity.normalized()
	velocity.x *= 0.8
	velocity.y *= 0.7

func die():
	get_tree().change_scene("res://scenes/other/die.tscn")
#Dialogs
func display_run_dialog():
	label.text = "RUN!"

func clear_label():
	label.text = ""

#scene transitions
func _on_scene_changer_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/room2.tscn") #room_start to room2


func _on_scene_changer2_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/room3.tscn") #room2 to room3 (right answer)


func _on_scene_changer_wrong_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/wrong_room1.tscn")


func _on_scene_changer5_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/room5.tscn") #room4 to room5 (right answer)

func _on_scene_changer4_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/room4.tscn") #room3 to room 4



func _on_scene_changer_wrong2_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/wrong_room2.tscn")

func play_dead_anim():
	anim.play("die")


func _on_AnimationPlayer_animation_finished(die):
	die()

func _on_scene_changer6_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/rooms/final_room.tscn") #room5 to final_room
