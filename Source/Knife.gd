extends CharacterBody2D
var multiplier=1.0
@export var velocity= Vector2(0.0,0.0)
var value=false




func _physics_process(delta: float) -> void:
	var direction=Vector2(_get_x(),_get_y())
	velocity*=direction*(1+globalvariables.zawarudoA)
	
	
	set_velocity(velocity)
	move_and_slide()

func _get_x()->float:
	if is_on_wall():
		return -1.0
#	elif Input.is_action_just_pressed("the_world"):
#		return 0.0
	else:
		return 1.0
func _get_y()->float:
	if is_on_wall():
		return -1.0
#	elif Input.is_action_just_pressed("the_world"):
#		return 0.0
	else:
		return 1.0



func _unhandled_key_input(event: InputEvent) -> void:
	if Input.is_action_pressed("the_world"):
			if globalvariables.CardC==true:
				value=not value
				set_physics_process(value)

