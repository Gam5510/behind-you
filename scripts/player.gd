extends CharacterBody2D

const SPEED = 130.0
const LIGHT_DRAIN = 0.02

func _physics_process(delta: float) -> void:
	var dir := Input.get_vector("left", "right", "up", "down")
	velocity = dir * SPEED
	move_and_slide()
	if dir == Vector2.ZERO:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0
	elif dir.x < 0:
		$AnimatedSprite2D.play("left")
	elif dir.x > 0:
		$AnimatedSprite2D.play("right")
	elif dir.y < 0:
		$AnimatedSprite2D.play("up")
	else:
		$AnimatedSprite2D.play("down")	
	$PointLight2D.texture_scale -= LIGHT_DRAIN * delta
	if $PointLight2D.texture_scale < 0.1:
		get_tree().reload_current_scene()
