extends KinematicBody2D
class_name Meteoro7
var direccion = Vector2.ZERO
var posAleatoria_y = [400, 250, 150]

func CambiarPosicion():
	randomize()
	position.x = 0
	position.y = posAleatoria_y[randi () % posAleatoria_y.size()]

func _physics_process(delta):
	
	direccion.x = 200
	direccion.y = - 50
	var velocidad = direccion * delta
	var colision = move_and_collide(velocidad)
	
	if colision:
		CambiarPosicion()
	if position.x > 1000:
		CambiarPosicion()
