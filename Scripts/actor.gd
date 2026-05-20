class_name Actor
extends CharacterBody2D

var is_dead := false
var move_speed := 140
@onready var health_component = $HealthComponent

static var player #static variables are shared across all instances

func ready():
	if player == null:
		player == get_tree().get_first_node_in_group("Player")
	add_to_group("enemies")
	

func _physics_process(_delta):
	if player == null:
		return

	var direction = (Actor.player.global_position - global_position).normalized()
	var distance = global_position.distance_to(Actor.player.global_position)

	var noise = Vector2(randf_range(-0.1, 0.1), randf_range(-0.1, 0.1))
	direction = (direction + noise).normalized()

	if distance > 40:
		velocity = direction * move_speed
	else:
		velocity = Vector2.ZERO

	move_and_collide(velocity * _delta)
