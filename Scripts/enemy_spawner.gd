extends Node2D

@export var enemy_prefab : PackedScene
var target : Node2D
@export var spawn_interval := .1
@export var spawn_distance := 400.0
@export var spawn_count := 3

var timer := 0.0

func _ready():
	target = get_tree().get_first_node_in_group("player")

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0.0

func _on_timer_timeout() -> void:

	var enemy = enemy_prefab.instantiate()
	add_child(enemy)   # always add first

	var offset = Vector2(randf_range(-200, 200), randf_range(-200, 200))
	enemy.global_position = target.global_position + offset
	enemy.player = target
	
	
	print(get_tree().get_nodes_in_group("enemies").size())
	print("EnemySpawner.gd running")
