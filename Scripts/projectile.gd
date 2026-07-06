extends CharacterBody2D

class_name projectile

@export var sound : AudioStreamPlayer
var speed = 30000

func _physics_process(delta: float) -> void:
	velocity.y = -delta * speed
	move_and_slide()
 
func _ready() -> void:
	sound.play()

func _on_shot_area_entered(area: Area2D) -> void:
	if area.name == "enemy" || area.name == "enemyfire":
		queue_free()
