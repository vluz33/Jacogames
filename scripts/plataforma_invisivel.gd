extends Area2D


@onready var colisao = $CollisionShape2D
@onready var animacao = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if not animacao.visible:
			animacao.show()
		else:
			colisao.set_deferred("disabled",true)
			animacao.hide()
