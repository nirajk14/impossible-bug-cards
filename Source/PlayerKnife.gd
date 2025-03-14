extends Area2D

const speed = 200
var value=false
var velocity = Vector2.ZERO

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

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

