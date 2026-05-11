extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval := 0.3
@export var spawn_distance := 640.0
@export var spawn_count := 3
   # usually player

#@onready var player: CharacterBody2D = $"../CharacterBody2D"
#@onready var enemy: CharacterBody2D = $"../enemy"

var timer := 0.0

#@export var target: CharacterBody2D

#func _process(delta):
	#timer += delta
	#if timer >= spawn_interval:
		#timer = 0.0
		##spawn_wave()
		#print("Spawner.gd running")
		

#func spawn_wave():
	#for i in range(spawn_count):
		#var enemy = enemy_scene.instantiate()
		#get_tree().current_scene.add_child(enemy)
		#var player = target
#
		#var dir = Vector2.RIGHT.rotated(randf() * TAU)
		##var pos = player.global_position.normalized() + dir * spawn_distance

		#enemy.global_position = pos
		
