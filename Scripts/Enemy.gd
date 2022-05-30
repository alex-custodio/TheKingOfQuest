extends KinematicBody2D

var initial_place
var final_place
export var speed = 1
var flip = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D2/AnimatedSprite.play("walk")
	initial_place = $".".position.x
	final_place = initial_place + 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (initial_place <= final_place and flip):
		$".".position.x += speed
		$Area2D2/AnimatedSprite.flip_h = false
		if ($".".position.x >= final_place):
			flip = false
	if ($".".position.x >= initial_place and !flip):
		$".".position.x -= speed
		$Area2D2/AnimatedSprite.flip_h = true
		if ($".".position.x <= initial_place):
			flip = true
	



