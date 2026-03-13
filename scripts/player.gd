extends CharacterBody2D

var speed = 200

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):

	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction * speed
	move_and_slide()

	update_animation(direction)


func update_animation(direction):

	if direction == Vector2.ZERO:
		sprite.stop()
		return

	if direction.y > 0:
		sprite.play("walk_down")
	elif direction.y < 0:
		sprite.play("walk_up")
	elif direction.x > 0:
		sprite.play("walk_right")
	elif direction.x < 0:
		sprite.play("walk_left")
