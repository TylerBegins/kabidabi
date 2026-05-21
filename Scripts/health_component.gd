extends Node

signal died

@export var max_health: int = 5
var current_health: int

func _ready():
	current_health = max_health

func take_damage(amount: int):
	current_health -= amount
	print("Took damage:", amount, "Remaining:", current_health)

	if current_health <= 0:
		die()

func die() -> void:
	print("I died")
	died.emit()
