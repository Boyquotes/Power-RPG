extends KinematicBody2D

onready var anima = $AnimationPlayer
onready var sprite = $Sprite

export (int) var speed = 200
var velocity = Vector2()

func _ready():
	anima.play("RESET")
	sprite.frame = 0
	sprite.flip_h = false
	anima.play("待机")

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		sprite.frame = 2
		sprite.flip_h = true
		anima.play("走")
		velocity.x += 1
	if Input.is_action_pressed("left"):
		sprite.frame = 2
		sprite.flip_h = false
		anima.play("走")
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		sprite.frame = 0
		sprite.flip_h = false
		anima.play("走")
		velocity.y += 1
	if Input.is_action_pressed("up"):
		sprite.frame = 1
		sprite.flip_h = false
		anima.play("走")
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
