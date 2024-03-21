extends Sprite2D

var direction
var width
var screen_bounds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	width = self.get_rect().size.x  # it's a square
	screen_bounds = self.get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x += direction.x * delta * 150
	if self.position.x < 0 + width/2:
		self.position.x = 0 + width/2
		direction.x *= -1
	elif self.position.x > screen_bounds.x - width/2:
		self.position.x = screen_bounds.x - width/2
		direction.x *= -1
		
	self.position.y += direction.y * delta * 150
	if self.position.y < 0 + width/2:
		self.position.y = 0 + width/2
		direction.y *= -1
	elif self.position.y > screen_bounds.y - width/2:
		self.position.y = screen_bounds.y - width/2
		direction.y *= -1
