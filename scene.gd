extends Node2D

var invader = preload("res://enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for j in range(1, 5):
		for i in range(1, 9):
			var instance = invader.instantiate()
			instance.position.x = i * 100
			instance.position.y = 50 * j
			get_tree().current_scene.add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
