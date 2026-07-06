extends Node2D
@export var animation : AnimationPlayer


func _process(_delta: float) -> void:
	animation.play("Charge")
