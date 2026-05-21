extends Actor


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ATTACKS = []
@export var projectile_prefab : PackedScene

func _ready():
	health_component.died.connect(_on_died)
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		health_component.take_damage(10)
	
		
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

func _on_died():
	queue_free()
