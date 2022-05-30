extends KinematicBody2D

#código do namur refatorado

var motion = Vector2()
const up = Vector2(0,-1)
const gravity = 20
const acceleration = 20
const max_speed = 130
const jump_height = -400
var flipped = false
var playerCanAttack = true
var playerCanAttack2 = false


func _physics_process(delta):
	flipped = false
	motion.y += gravity
	var friction = false
	if Input.is_action_pressed("ui_right"):
		flipped = false
		$AnimatedSprite.flip_h = false
		motion.x = min(motion.x+acceleration, max_speed)
		$AnimatedSprite.play("walk-right")
		
	elif Input.is_action_pressed("ui_left"):
		flipped = true
		motion.x = max(motion.x-acceleration, -max_speed)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk-right")
		
		
	else:
		#if flipped == true:
		#	$AnimatedSprite.flip_h = true
		#elif flipped == false:
		#	$AnimatedSprite.flip_h = false
		friction = true
		$AnimatedSprite.play("idle")
		
	#if playerCanAttack:
		#if Input.is_action_pressed("ui_attack"):
			#$AnimatedSprite.play("attack")
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_height
		if friction == true:
			motion.x = lerp(motion.x, 0,0.2)
	else:
		
		if motion.y < 0:
			if flipped == true:
				$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("jump")
			
		else:
			$AnimatedSprite.play("fall")
			
			
		if friction == true:
			motion.x = lerp(motion.x, 0,0.05)
	motion = move_and_slide(motion, up)
	


