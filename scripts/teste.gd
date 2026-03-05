extends Node2D

const WAIT_DURATION := 2.0

@onready var platform := $platform as AnimatableBody2D
@export var move_speed := 3.0
@export var distance := 200
@export var move_horizontal := true

var follow := Vector2.ZERO
var platform_center := 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_platform()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	platform.position = platform.position.lerp(follow, 0.5)


func move_platform():
	var _move_direction = Vector2.RIGHT * distance if move_horizontal else Vector2.UP * distance
	var _duration = _move_direction.length() / float(move_speed * platform_center)
	var _platform_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	_platform_tween.tween_property(self, "follow", _move_direction, _duration).set_delay(WAIT_DURATION)
	_platform_tween.tween_property(self, "follow", Vector2.ZERO, _duration).set_delay(WAIT_DURATION)
