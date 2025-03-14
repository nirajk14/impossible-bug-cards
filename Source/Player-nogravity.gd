extends CharacterBody2D

@export var speed:=Vector2(800.0,700.0)
var velocity=Vector2.ZERO
var gravity= 800.0
const FIREBALL= preload("res://Source/PlayerKnife.tscn")

func _physics_process(delta: float) -> void:
	var direction:= Vector2(_get_x(),_get_y())
	if Input.is_action_just_pressed("slow_down"):
		speed *= 0.6
	if Input.is_action_just_released("slow_down"):
		speed *= (1/0.6)
	if globalvariables.CardA:
		
		if Input.is_action_pressed("change_collision"):
			set_collision_layer_value(0,false)
			set_collision_layer_value(1,true)
		if Input.is_action_pressed("undo_collision"):
			set_collision_layer_value(1,false)
			set_collision_layer_value(0,true)
	if 1:
		if Input.is_action_just_pressed("shoot"):
			var fireball=FIREBALL.instantiate()
			get_parent().add_child(fireball)
			fireball.position=$Marker2D.global_position
	velocity = speed * direction
	
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	


func _get_x()->float:
	return Input.get_action_strength("move_right")-Input.get_action_strength("move_left")

func _get_y()->float:
	return Input.get_action_strength("move_down")-Input.get_action_strength("move_up")


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()