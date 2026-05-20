extends Actor


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ATTACKS = []
@export var projectile_prefab : PackedScene


var i = 0

func _physics_process(_delta: float) -> void:
	
		
	var input_vector := Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	input_vector = input_vector.normalized()
	
	
	velocity = input_vector * SPEED
	move_and_collide(velocity * _delta)
	
func attack():
	var projectile = projectile_prefab.instantiate()
	get_tree().current_scene.add_child(projectile)
	projectile.global_position = global_position + Vector2(50, 0)
	

func _on_attack_circle_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(1)
