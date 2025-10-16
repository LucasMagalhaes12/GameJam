extends Camera2D
@onready var player1: CharacterBody2D = $"../Players/player1"
@onready var player2: CharacterBody2D = $"../Players/player2"

@export var suavidade_movimento: float = 0.1
@export var margem_vertical: float = 150.0

# Posição horizontal fixa da câmera
var x_posicao_fixa: float
# Guarda a posição vertical mais alta que a câmera já alcançou (y_min)
var y_limite_inferior: float

func _ready():
	if not player1 or not player2:
		push_error("As referências dos jogadores não foram definidas no Camera2D.")
		return
		
	x_posicao_fixa = global_position.x
	
	var y1 = player1.global_position.y
	var y2 = player2.global_position.y
	y_limite_inferior = (y1 + y2) / 2.0


func _process(delta):
	if not player1 or not player2:
		return

	var y1 = player1.global_position.y
	var y2 = player2.global_position.y
	
	var y_min = min(y1, y2)
	var y_max = max(y1, y2)

	var centro_y_alvo = (y_min + y_max) / 2.0
	
	if centro_y_alvo < y_limite_inferior:
		y_limite_inferior = centro_y_alvo
	
	var y_final = y_limite_inferior
	
	# 3. Mover a câmera (apenas Y)
	var centro_alvo_final = Vector2(x_posicao_fixa, y_final)
	
	global_position = global_position.lerp(centro_alvo_final, 1.0 - pow(suavidade_movimento, delta))
	
func get_limit_vertical() -> float:
	return y_limite_inferior
