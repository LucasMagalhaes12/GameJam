extends Area2D

@export var offset_y: float = 10.0

@onready var camera_node: Camera2D = $"../../Camera2D"
@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body: Node2D):
	print("Jogador", body.name, " caiu fora da tela!")


func _ready():
	body_entered.connect(_on_body_entered)
	var shape = collision_shape.shape as WorldBoundaryShape2D
	if shape:
		shape.normal = Vector2(0, -1) # Aponta para cima, bloqueando a queda


func _process(delta):
	var camera_pos = camera_node.global_position
	var viewport_size = get_viewport_rect().size
	var camera_zoom = camera_node.zoom

	var metade_altura_visivel = (viewport_size.y / camera_zoom.y) / 2.0

	var y_alvo = camera_pos.y + metade_altura_visivel + offset_y
	
	if y_alvo < global_position.y:
		global_position.y = y_alvo
	global_position.x = camera_pos.x
