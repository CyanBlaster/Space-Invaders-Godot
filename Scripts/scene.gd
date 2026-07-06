extends Node2D

var invader = preload("res://Scenes/enemy.tscn")
var timer = 0
@export var music : AudioStreamPlayer
# Called when the node enters the scene tree for the first time.

func spawn_enemies():
	for j in range(1, 7):
		for i in range(1, 9):
			var instance = invader.instantiate()
			instance.position.x = i * 100
			instance.position.y = 50 * j
			get_tree().current_scene.add_child(instance)
			global.enemies += 1
			
func _ready() -> void:
	spawn_enemies()
	music.play()

func _process(_delta: float) -> void:
	if(global.enemies <= 0):
		global.enemies += 1
		timer = 3
	if(timer > 0):
		timer -= _delta
		if(timer <= 0):
			global.level += 1
			global.enemies -= 1
			spawn_enemies()
	if(Input.is_action_just_pressed("music")):
		if(music.playing):
			music.playing = false
		else:
			music.playing = true
