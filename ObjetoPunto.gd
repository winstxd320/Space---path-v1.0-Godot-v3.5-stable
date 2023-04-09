extends KinematicBody2D
class_name ObjetoPuntos

var direccion = Vector2.ZERO
func _ready():
	CambiarPosicion()
	
func CambiarPosicion():
	randomize()
	var posAleatoria_x = int(rand_range(0, 900))
	var posAleatoria_y = int(rand_range(0, 450))
	position.x = posAleatoria_x
	position.y = posAleatoria_y
	
