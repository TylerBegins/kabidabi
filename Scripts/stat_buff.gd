extends Resource
class_name StatBuff

enum BuffType {
	MULTIPLY,
	ADD,
}

@export var stat: Stats.BuffableStats
@export var buff_amount: float
@export var buff_type: BuffType
