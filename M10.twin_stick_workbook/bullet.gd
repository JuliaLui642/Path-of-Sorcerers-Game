class_name Bullets extends Area2D

@export var speed := 750

var max_range := 1000.0

var _traveled_distance = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physic_process(delta: float) -> void:
	var distance := speed * delta
	var motion := Vector2.RIGHT.rotated(rotation) * distance
	
	position += motion
	
	_traveled_distance += distance
	if _traveled_distance > max_range:
		_destroy()
	
func _destroy():
	queue_free()
