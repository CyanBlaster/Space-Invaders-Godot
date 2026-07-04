extends CharacterBody2D

class_name projectile

var speed = 30000

func _physics_process(delta: float) -> void:
	velocity.y = -delta * speed
	move_and_slide()
 


func _on_shot_area_entered(area: Area2D) -> void:
	if area.name == "enemy":
		queue_free()
