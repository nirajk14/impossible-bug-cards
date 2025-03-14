extends Area2D

const speed = -200
var value=false
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.x=speed*delta
	translate(velocity)



func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
func _unhandled_key_input(event: InputEvent) -> void:
	if Input.is_action_pressed("the_world"):
			if globalvariables.CardC==true:
				value=not value
				set_physics_process(value)



func _on_EnemyKnife_body_entered(body: PhysicsBody2D) -> void:
	queue_free()
