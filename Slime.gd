extends Area2D


var initial_place
var final_place
var speed = 1
var flip = true
export var blocks = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("SlimeWalk")
	initial_place = $".".position.x
	final_place = initial_place + blocks

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (initial_place <= final_place and flip):
		$".".position.x += speed
		$AnimatedSprite.flip_h = false
		if ($".".position.x >= final_place):
			flip = false
	if ($".".position.x >= initial_place and !flip):
		$".".position.x -= speed
		$AnimatedSprite.flip_h = true
		if ($".".position.x <= initial_place):
			flip = true




func _on_killarea_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("SlimeDie")
		$killarea/CollisionShape2D.queue_free()
		$deathh/CollisionShape2D.queue_free()
		speed = 0
