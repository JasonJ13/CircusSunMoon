extends CharacterBody2D

@export var SPEED : float = 40000.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	velocity.x = Input.get_axis("Left", "Right")
	velocity.y = Input.get_axis("Up", "Down")
	velocity = velocity.normalized() * SPEED * delta
	
	move_and_slide()
