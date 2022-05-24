extends KinematicBody2D

#código do namur refatorado

var motion = Vector2()
const up = Vector2(0,-1)
const gravity = 20
const acceleration = 20
const max_speed = 130
const jump_height = -400

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+acceleration, max_speed)
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-acceleration, -max_speed)
		
	else:
		friction = true
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_height
		if friction == true:
			motion.x = lerp(motion.x, 0,0.2)
	else:
		#pra quando for fazer animação
		#if motion.y < 0:
			#$AnimatedSprite.play("jump")
		#else:
			#$AnimatedSprite.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0,0.05)
	motion = move_and_slide(motion, up)
	pass
