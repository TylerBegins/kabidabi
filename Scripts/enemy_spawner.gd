extends Node2D

@export var enemy_prefab : PackedScene
@export var target : Node2D
@export var spawn_interval := .1
@export var spawn_distance := 400.0
@export var spawn_count := 3

var timer := 0.0


func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0.0

func _on_timer_timeout() -> void:
	
	print("SPAWNING ENEMY")
	
	var enemy = enemy_prefab.instantiate()
	var offset = Vector2(randf_range(-200, 200), randf_range(-200, 200))
	enemy.global_position = target.global_position + offset
	enemy.player = target
	
	add_child(enemy)
	print("Spawner target:", target)
	print(get_tree().get_nodes_in_group("enemies").size())
	print("EnemySpawner.gd running")
