extends AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	flip_h = Global.direita
	if not Global.walk and not Global.jump and not Global.fall:
		play("Idle")
	elif Global.walk and not Global.jump and not Global.fall:
		play("walk")
	elif Global.jump:
		play("jump")
	elif Global.fall:
		play("fall" )
