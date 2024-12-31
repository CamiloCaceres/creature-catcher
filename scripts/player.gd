extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	play_anim(velocity != Vector2.ZERO)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D  # Make sure you have an AnimatedSprite2D node named this

	if dir == "right":
		anim.flip_h = false
		if movement:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	if dir == "left":
		anim.flip_h = true
		if movement:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	if dir == "down":
		anim.flip_h = true
		if movement:
			anim.play("front_walk")
		else:
			anim.play("front_idle")
			
	if dir == "up":
		anim.flip_h = true
		if movement:
			anim.play("back_walk")
		else:
			anim.play("back_idle")
