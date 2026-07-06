extends Node2D

@export var one : Sprite2D
@export var two : Sprite2D
@export var three : Sprite2D

func _process(_delta: float) -> void:
	if(global.health == 1):
		one.show()
		two.hide()
		three.hide()
	elif(global.health == 2):
		one.hide()
		two.show()
		three.hide()
	elif(global.health == 3):
		one.hide()
		two.hide()
		three.show()
