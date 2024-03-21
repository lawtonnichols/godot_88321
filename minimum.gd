extends Node

var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.position.x += direction.x * delta * 100
	if not get_viewport().get_visible_rect().encloses(Rect2($Sprite2D.global_position - $Sprite2D.get_rect().size/2, $Sprite2D.get_rect().size)):
		$Sprite2D.position.x -= direction.x * delta
		direction.x *= -1
	
	$Sprite2D.position.y += direction.y * delta * 100
	if not get_viewport().get_visible_rect().encloses(Rect2($Sprite2D.global_position - $Sprite2D.get_rect().size/2, $Sprite2D.get_rect().size)):
		$Sprite2D.position.y -= direction.y * delta * 100
		direction.y *= -1
