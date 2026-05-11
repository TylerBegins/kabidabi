extends Area2D

const SPEED := 300.0
func ready():
	await get_tree().create_timer(3.0).timeout
	queue_free()
	
func _physics_process(delta: float) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta

func _on_body_entered(body: Node2D) -> void:	
	if body is Actor:
		body.take_damage(1)
	queue_free()
