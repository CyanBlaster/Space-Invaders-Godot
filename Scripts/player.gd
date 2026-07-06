extends CharacterBody2D

@export var aura : Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var projectile1 = preload("res://Scenes/projectile.tscn")
var charged_projectile = preload("res://Scenes/charged_shot.tscn")
var charge = 0


@export var charge_sound : AudioStreamPlayer

func _ready() -> void:
	aura.hide()

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if(Input.is_action_just_pressed("Shoot")):
		var instance = projectile1.instantiate()
		instance.position.x = position.x
		instance.position.y = position.y
		get_tree().current_scene.add_child(instance)
	if(Input.is_action_pressed("Shoot")):
		charge += 0.1
		if(charge >= 5):
			aura.show()
	if(Input.is_action_just_released("Shoot")):
		aura.hide()
		if(charge >= 5):
			var instance = charged_projectile.instantiate()
			instance.position.x = position.x
			instance.position.y = position.y
			get_tree().current_scene.add_child(instance)
		charge = 0
	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "enemyfire":
		global.health -= 1
		if(global.health <= 0):
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
