extends CharacterBody2D

@export var rot_speed: float = 1.0
var run_speed = 150
var player = null
var eHealth = 3
var canFollow = false

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		var target_dir = (player.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated(self.global_rotation)
		self.global_rotation = current_dir.lerp(target_dir, rot_speed * delta).angle()
		if canFollow == true:
			velocity = position.direction_to(player.position) * run_speed
	move_and_slide()
	
	if eHealth == 0:
		queue_free()

func _on_DetectRadius_body_entered(body):
	if body.is_in_group("Player"):
		print("enter")
		player = body

func _on_DetectRadius_body_exited(body):
	if body.is_in_group("Player"):
		print("exit")
		player = null


func hit():
	eHealth -= 1

func _on_in_range_body_entered(body):
	if body.is_in_group("Player"):
		canFollow = true

func _on_in_range_body_exited(body):
	if body.is_in_group("Player"):
		canFollow = false
