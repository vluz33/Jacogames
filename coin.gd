extends Area2D


@onready var animacao = $AnimatedSprite2D
@onready var colisao = $CollisionShape2D
@onready var audio = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
 

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		colisao.set_deferred("disabled",true)
		Global.item+=1
		animacao.play("hit")
		await animacao.animation_finished
		audio.play()
		animacao.play("break")
		await animacao.animation_finished
		animacao.hide()
		queue_free()
		
		
